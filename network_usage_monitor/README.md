📡 Internet Usage Monitor Script

> Author: Seif Eldien Ahmad Mohammad
Date: July 30, 2025
Task: Track per-device internet consumption on Wi-Fi networks using Bash scripting and IPTables



This Bash script was created to monitor internet usage per device on any local Wi-Fi network and generate alerts when usage exceeds specified limits. It combines tools like arp-scan, nmap, and iptables to provide a lightweight, automated network bandwidth tracker tailored for small labs or personal use.


---

⚙️ Features Overview

1. Admin Prompt:

Enter the Wi-Fi SSID (network name)

Set a default bandwidth limit in GB (used for all devices unless overridden)



2. Network Scan:

Detects active IPs on the current Wi-Fi using arp-scan

Resolves hostnames from IPs using nmap



3. Traffic Monitoring:

Tracks traffic per IP using iptables counters

Converts raw bytes into GB and stores usage persistently



4. Alert System:

Alerts if any device exceeds its allowed limit

Alerts saved in alerts.txt





---

💡 Enhancements Implemented

Internet interface as a variable at the beginning of the script for easier reusability across machines

Hostname-based limits: Devices with names like printer-limit10 override the global bandwidth limit

Structured directory creation: Each SSID gets its own folder to avoid data collision



---

📁 Output Directory Structure

For each SSID, a dedicated folder is created:
./InternetUsage/SSID_NAME/

It includes:

File Name	Description

IPs.txt	List of active IPs on the network
ip_host_map.txt	Mapping of IPs to their resolved hostnames
usage_data.txt	Persistent record of GB consumed per IP
consumptionReport.txt	Hourly report of each device’s data usage
alerts.txt	Devices that exceeded their limits



---

📐 Bandwidth Limit Rules

Scenario	Bandwidth Limit Applied

Hostname doesn't include a limit	Uses the default GB set by admin
Hostname includes limitXX	Uses custom XX GB as the limit


✅ Examples

Hostname	Limit Applied

desktop-pc	33.333 GB
tv-limit25	25 GB
unknown	33.333 GB



---

⏱️ Suggested Cron Job

To automatically run the script every hour:

0 * * * * /bin/bash /full/path/to/InternetUsageMonitor.sh >> /dev/null 2>&1


---

🔐 Requirements

Ensure the following tools are installed and accessible via sudo:

Tool	Purpose	Install Command

arp-scan	Scan network for active IPs	sudo apt install arp-scan
nmap	Resolve hostnames from IPs	sudo apt install nmap
iptables	Track data usage per IP	Installed by default
iwgetid	Detect current Wi-Fi SSID	Installed by default
bc	Perform floating-point math	sudo apt install bc



---

🧠 Notes

The script isolates data per SSID, ensuring clarity if you switch networks.

Tracks cumulative data usage (usage stacks over each run).

Designed for home labs, not dynamic DHCP-heavy or enterprise networks.

Root permissions required due to use of low-level networking tools.

Interface name can be changed easily by modifying the top variable in the script.



---

✅ Tested On

✅ Parrot OS (Security Edition)

✅ Debian/Ubuntu-based systems

✅ Bash 5.x+



---
<sub><i>Keywords: Seif Eldien, Seif Eldin, Seif El Dien, Seif El Din, Seif Ahmad, Seif Ahmed, Seif Mohamed, Seif Mohammad, Seif Mohammed, Saif Eldien, Saif Eldin, Saif Ahmad, Saif Ahmed, Saif Mohammed, Saif Mohamed, سيف الدين, سيف احمد, سيف محمد, Cybersecurity, Linux Administration, Bash Script, Network Monitoring, Bandwidth Tracker, GitHub Portfolio, Red Team, Ethical Hacking, Penetration Testing, Real-Time Monitoring, IPTables, Cron Jobs, Open Source, Parrot OS, Network Automation, System Monitoring, Internet Usage Script</i></sub>
