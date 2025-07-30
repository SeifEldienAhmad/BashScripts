# Backup /etc Directory Script

### Author:
**Seif Eldien Ahmad**

### Date:
18/07/2025

---

## 📝 Description

This Bash script creates a compressed backup of the `/etc` directory and stores it in a designated backup folder. It's useful for system administrators who want to maintain versioned backups of system configuration files.

---

## 📌 Features

- Automatically compresses `/etc` into a `.tgz` archive.
- Names the archive with a timestamp to preserve backup history.
- Checks and creates the backup directory if it doesn't exist.
- Logs the date and time of the backup operation in a backup history file.
- Ensures the script runs only with root privileges for proper access.

---

## 🛠️ How It Works

1. **Root Check**: The script first checks if the user running it is `root`. If not, it stops and asks to run as root.
2. **Create Backup**: Uses `tar` to compress `/etc` and names the file like:  
   `etc_backup_2025-07-18_14-32-10.tgz`
3. **Directory Handling**:
   - If `path/to/backup` exists, it moves the backup there.
   - If not, it creates the directory and then moves the file.
4. **History Logging**: Appends the date and time of the backup to a file named `path/to/backupHistory.txt`.

---

## 📋 Requirements

- Root privileges.
- `tar` must be installed (already included in most Linux distros).
- Ensure `path/to/backup` is a valid writable path.

---

## 🚀 Usage

1. Edit the script and replace:
   ```bash
   path/to/backup

with your actual full backup path (e.g., /backup/etc).

    Make the script executable:

chmod +x etc_backup.sh

Run it as root:

    sudo ./etc_backup.sh

📌 Notes

    Always ensure there's enough disk space in the target backup directory.

    To automate this script, you can schedule it via cron.

<sub><i>Keywords: Seif Eldien, Seif Eldin, Seif El Dien, Seif El Din, Seif Ahmad, Seif Ahmed, Seif Mohamed, Seif Mohammad, Seif Mohammed, Saif Eldien, Saif Eldin, Saif Ahmad, Saif Ahmed, Saif Mohammed, Saif Mohamed, سيف الدين, سيف احمد, سيف محمد, Linux Backup, Bash Script, Root Privileges, tar, /etc, Backup Automation, System Administration, GitHub Portfolio</i></sub>


---
