#!/bin/bash

# Author: Seif Eldien Ahmad
# Purpose: Monitor per-device internet usage with optional custom limits per hostname
# Date: 2025-07-30

# Ask admin for default limit in GB
read -rp "Enter default GB limit per device (e.g., 33.333): " LIMIT

# Ask for target SSID
read -rp "Enter your target SSID: " TARGET_SSID
CURRENT_SSID=$(iwgetid -r)

if [ "$CURRENT_SSID" != "$TARGET_SSID" ]; then
  echo "[INFO] Not connected to $TARGET_SSID (currently on $CURRENT_SSID). Exiting."
  exit 0
fi

# Setup working directory
BASE_DIR="path/to/your/aimed/dir/$TARGET_SSID"
mkdir -p "$BASE_DIR"

# Scan IPs using arp-scan
sudo arp-scan --interface=wlp2s0 --localnet | awk '/192\.168\./ {print $1}' > "$BASE_DIR/IPs.txt"

# Map IPs to hostnames
> "$BASE_DIR/ip_host_map.txt"
for IP in $(cat "$BASE_DIR/IPs.txt"); do
  [ -z "$IP" ] && continue
  HOSTNAME=$(nmap -sP "$IP" | awk -F' ' '/Nmap scan report/ {print $NF}' | tr -d '()')
  [ -z "$HOSTNAME" ] && HOSTNAME="unknown"
  echo "$IP $HOSTNAME" >> "$BASE_DIR/ip_host_map.txt"
done

# Prepare usage files
USAGE_FILE="$BASE_DIR/usage_data.txt"
touch "$USAGE_FILE"
> "$BASE_DIR/consumptionReport.txt"
> "$BASE_DIR/alerts.txt"

# Loop through IPs and monitor usage
while read -r IP HOSTNAME; do
  [ -z "$IP" ] && continue

  sudo iptables -I INPUT -s "$IP" -j ACCEPT
  sudo iptables -I OUTPUT -d "$IP" -j ACCEPT

  STATS=$(sudo iptables -L -v -n | grep "$IP")
  BYTES=$(echo "$STATS" | awk '{sum+=$2} END {print sum}')
  GB=$(echo "scale=6; $BYTES / (1024*1024*1024)" | bc)

  OLD_GB=$(grep "^$IP " "$USAGE_FILE" | awk '{print $2}')
  [ -z "$OLD_GB" ] && OLD_GB=0
  TOTAL=$(echo "scale=6; $OLD_GB + $GB" | bc)

  grep -v "^$IP " "$USAGE_FILE" > "$BASE_DIR/temp" && mv "$BASE_DIR/temp" "$USAGE_FILE"
  echo "$IP $TOTAL" >> "$USAGE_FILE"
  echo "$IP ($HOSTNAME) used $TOTAL GB" >> "$BASE_DIR/consumptionReport.txt"

  # Determine limit: from hostname or use default
  HOST_LIMIT=$(echo "$HOSTNAME" | grep -o 'limit[0-9]\+' | grep -o '[0-9]\+')
  [ -z "$HOST_LIMIT" ] && HOST_LIMIT=$LIMIT

  EXCEEDED=$(echo "$TOTAL >= $HOST_LIMIT" | bc)
  if [ "$EXCEEDED" -eq 1 ]; then
    echo "[ALERT] $IP ($HOSTNAME) exceeded $HOST_LIMIT GB (Total: $TOTAL GB)" | tee -a "$BASE_DIR/alerts.txt"
  fi

done < "$BASE_DIR/ip_host_map.txt"
