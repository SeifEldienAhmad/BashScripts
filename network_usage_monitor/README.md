# 📡 Internet Usage Monitor Script

This script monitors internet usage per device on any Wi-Fi network and alerts the admin when usage exceeds specified limits.

---

## ⚙️ How It Works

1. **Prompts the admin** to:
   - Enter the target Wi-Fi SSID (network name).
   - Set a **default bandwidth limit in GB** (applied to all devices unless overridden).
2. Uses `arp-scan` to detect all active IPs in the local network.
3. Resolves hostnames for each IP using `nmap`.
4. Tracks the **total data consumed** per device (based on `iptables` counters).
5. Compares each device’s usage against its limit:
   - If exceeded, logs an alert in `alerts.txt`.

---

## 📁 Output Files

Inside a directory named after the SSID (`path/to/your/aimed/dir/SSID_NAME/`):

- `IPs.txt`: list of detected IPs
- `ip_host_map.txt`: mapping of IPs to hostnames
- `usage_data.txt`: persistent record of consumption per IP
- `consumptionReport.txt`: hourly report of current GB used
- `alerts.txt`: triggered alerts for devices exceeding limits

---

## 📐 Bandwidth Limit Logic

- 💬 **Admin-defined default limit** (e.g., `33.333 GB`) applies to all devices.
- 🧠 **Optional hostname-specific override**:
  - If a device’s hostname includes `limitXX`, that number overrides the default.
    - Example: `tv-limit25` → 25 GB limit

### 🔍 Examples

| Hostname         | Limit Applied |
|------------------|---------------|
| user-laptop      | 33.333 GB     |
| tv-limit25       | 25 GB         |
| unknown          | 33.333 GB     |

---

## ⏱️ Suggested Cron Job

To run this script **every hour**, add to crontab using `crontab -e`:

```bash
0 * * * * /bin/bash /full/path/to/your/script.sh >> /dev/null 2>&1

🔐 Requirements

Make sure the following tools are installed and accessible with sudo:
Tool	Purpose	Install Command (Debian-based)
arp-scan	Detect active IPs in the network	sudo apt install arp-scan
nmap	Resolve hostnames from IPs	sudo apt install nmap
iptables	Track packet usage by IP	Installed by default
iwgetid	Detect current Wi-Fi SSID	Installed by default
bc	Perform floating-point calculations	sudo apt install bc
🧠 Notes

    ⚙️ The script automatically creates directories for each SSID it monitors. Each network gets isolated data storage.

    🧍‍♂️ Designed for personal or small-lab monitoring, not enterprise-level usage.

    🔁 Cumulative consumption: If the script runs hourly, it adds each hour's usage to the previous total.

    📎 Assumes DHCP IPs remain mostly static. If IPs change often, consumption tracking may be inconsistent.

    💻 Requires root privileges (sudo) to access low-level network data.

✅ Tested On

    ✅ Parrot OS (Security Edition)

    ✅ Debian/Ubuntu-based systems

    ✅ bash 5.x or higher


---
<sub><i>Keywords: Seif Eldien, Seif Eldin, Seif El Dien, Seif El Din, Seif Ahmad, Seif Ahmed, Seif Mohamed, Seif Mohammad, Seif Mohammed, Saif Eldien, Saif Eldin, Saif Ahmad, Saif Ahmed, Saif Mohammed, Saif Mohamed, سيف الدين, سيف احمد, سيف محمد, Cybersecurity, Linux Administration, Bash Script, Network Monitoring, Bandwidth Tracker, GitHub Portfolio, Red Team, Ethical Hacking, Penetration Testing, Real-Time Monitoring, IPTables, Cron Jobs, Open Source, Parrot OS, Network Automation, System Monitoring, Internet Usage Script</i></sub>
