# CPU and RAM Usage Monitor Script

### Author:
**Seif Eldien Ahmad Mohammad**

### Date:
20/07/2025

---

## 📝 Description

This Bash script monitors the system's CPU and RAM usage in real-time. It logs the current usage in a log file and sends notifications and email alerts if usage exceeds 80%. This is useful for proactive system administration and preventing performance bottlenecks.

---

## 📌 Features

- Calculates CPU usage by combining user and system load.
- Calculates RAM usage as a percentage of total memory.
- Logs all usage entries with a timestamp to a local file.
- Sends alert emails and desktop notifications if usage exceeds a defined threshold (80%).

---

## 🛠️ How It Works

1. **CPU Usage**:  
   Uses `top` and `awk` to get the combined user (`%us`) and system (`%sy`) usage.

2. **RAM Usage**:  
   Extracts used and total memory from `free` and calculates the percentage used.

3. **Logging**:  
   Appends the current CPU and RAM usage with the timestamp to:
   ```bash
   your/path/to/usageLog.txt

    Alerts:

        If usage > 80%, it:

            Sends an email using the mail command.

            Sends a desktop alert using notify-send.

📋 Requirements

    Utilities:

        top

        awk

        free

        mail

        bc

        notify-send (optional, for GUI notifications)

    A configured local mail system (like mailx, sendmail, or msmtp)

    X server if you want to use notify-send for desktop notifications

    Script must be run with sufficient privileges to access system stats

    Replace:

        your/path/to/usageLog.txt with a valid writable log path.

        yourE-mail with your actual email address.

🚀 Usage

    Make the script executable:

chmod +x monitor_usage.sh

Edit the script:

    Change your/path/to/usageLog.txt to something like /var/log/usageLog.txt

    Replace yourE-mail with your actual email (e.g., admin@example.com)

Run manually or schedule it via cron for continuous monitoring:

    sudo ./monitor_usage.sh

📌 Notes

    Can be combined with cron for scheduled execution (e.g., every 5 minutes).

    You may disable notify-send lines on servers without a GUI.

    Logs may grow over time; consider log rotation or cleanup strategy.

<sub><i>Keywords: Seif Eldien, Seif Eldin, Seif El Dien, Seif El Din, Seif Ahmad, Seif Ahmed, Seif Mohamed, Seif Mohammad, Seif Mohammed, Saif Eldien, Saif Eldin, Saif Ahmad, Saif Ahmed, Saif Mohammed, Saif Mohamed, سيف الدين, سيف احمد, سيف محمد, Bash Monitor Script, CPU Monitoring, RAM Monitoring, Linux Alert Script, Real-time Usage Logging, notify-send, top, free, System Performance Monitor, GitHub Portfolio</i></sub>


---
