# Linux System Update Script

### Author:
**Seif Eldien Ahmad Mohammad**

### Date:
17/07/2025

---

## 📝 Description

This script automates the process of updating a Debian-based Linux system (such as Ubuntu or Parrot OS). It performs a full system upgrade, removes unnecessary packages, and logs the update timestamp for reference.

---

## 📌 Features

- Runs `apt update` to refresh package lists.
- Performs `full-upgrade` to apply all available updates.
- Runs `autoremove` to clean up unnecessary dependencies.
- Appends a timestamp of the update completion to a log file on the Desktop.

---

## 📋 Requirements

- Debian-based Linux distribution
- Root privileges (`sudo`)
- Active internet connection

---

## 🚀 Usage

1. Make the script executable:
   ```bash
   chmod +x update_system.sh

    Run the script with:

./update_system.sh

A file called updateHistory.txt will be created (or appended) on your Desktop, showing the last update time:

    Update finished on: 2025-07-17  20:45:33

⚠️ Notes

    Must be run with sudo or from a user with sudo privileges.

    Suitable for personal use or as a scheduled task using cron.

    If you're running a non-English system, ~/Desktop/ might need to be changed to the appropriate localized path.

<sub><i>Keywords: Seif Eldien, Seif Eldin, Seif Ahmad, Seif Ahmed, Seif Mohammed, Seif Mohamed, سيف الدين, سيف احمد, سيف محمد, Linux update script, apt update, full-upgrade, apt autoremove, Debian update automation, Bash script Linux, automate updates Linux, Linux maintenance, Parrot OS update, Ubuntu update, updateHistory log, GitHub Portfolio</i></sub>


---
