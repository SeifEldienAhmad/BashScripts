#!/bin/bash

# Author: Seif Eldien Ahmad  
# Task: Monitor CPU and RAM usage, and alert if usage exceeds 80%
# Date: 20/7/2025

# Start

# Get the CPU usage by summing the user (%us) and system (%sy) from the top command
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Get the RAM usage percentage: used memory / total memory * 100
RAM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Log the date, CPU, and RAM usage to a log file
echo "$(date '+%Y-%m-%d  %H:%M:%S') - CPU: ${CPU}% - RAM: ${RAM}%" >> "your/path/to/usageLog.txt"

# Check if CPU usage exceeds 80%, and print a warning if it does
if [ $(echo "$CPU > 80" | bc -l) -eq 1 ]
then
    echo "High CPU usage: $CPU%" | mail -s "CPU Alert from $(hostname)" yourE-mail
    notify-send "High CPU usage!" "CPU usage is ${CPU}%"
fi

# Check if RAM usage exceeds 80%, and print a warning if it does
if [ $(echo "$RAM > 80" | bc -l) -eq 1 ]
then
    echo "High RAM usage: $RAM%" | mail -s "RAM Alert from $(hostname)" yourE-mail
    notify-send "High RAM usage!" "RAM usage is ${RAM}%"
fi

# End
