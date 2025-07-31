#!/bin/bash
# Author: Seif Eldien Ahmad Mohammad
# Task: Network usage logger per device
# Date: 30/7/2025

# Set your network interface here (e.g., wlan0 or eth0)
INTERFACE="wlan0"

# Get current SSID
current_ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)

# Ask admin for expected SSID
read -p "Enter expected Wi-Fi SSID: " expected_ssid

# Check if SSID matches
if [[ "$current_ssid" != "$expected_ssid" ]]; then
  echo "You're not connected to the expected network: $expected_ssid"
  exit 1
fi

# Ask admin for usage limit
read -p "Enter GB usage limit per device: " limit

# Define base directory
BASE_DIR="/path/to/your/dir"

# Define log folder by current month
month=$(date +"%Y-%m")
log_dir="$BASE_DIR/$month"
mkdir -p "$log_dir"

# Define file name by day and hour
timestamp=$(date +"%d-%m-%Y_%H-%M")
usage_file="$log_dir/usage_data_$timestamp.txt"
report_file="$log_dir/consumptionReport_$timestamp.txt"
alert_file="$log_dir/alerts_$timestamp.txt"

# Run arp-scan to resolve device names
echo "[*] Scanning local network on interface: $INTERFACE..."
mapfile -t devices < <(sudo arp-scan --interface="$INTERFACE" --localnet | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | awk '{print $1" "$2" "$3}')

# Get current connections from /proc/net/dev
echo "[*] Logging current usage..."
for device in "${devices[@]}"; do
    ip=$(echo "$device" | awk '{print $1}')
    mac=$(echo "$device" | awk '{print $2}')
    name=$(echo "$device" | awk '{print $3}')

    # Simulate getting usage for now
    usage=$(awk -v min=0.1 -v max=5 'BEGIN{srand(); print min+rand()*(max-min)}') # simulate GB

    echo "$ip $usage $name" >> "$usage_file"

    echo "$ip ($name) used ${usage} GB" >> "$report_file"

    # Trigger alert if usage exceeds limit
    if (( $(echo "$usage > $limit" | bc -l) )); then
        echo "[ALERT] $ip ($name) has exceeded ${limit} GB (Total: ${usage} GB)" >> "$alert_file"
    fi
done

echo "Done! Files saved in $log_dir"

#END
