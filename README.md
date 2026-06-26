# 🔧 Bash Scripts by Seif Eldien Ahmad Mohammad

A curated collection of Bash scripts built during my journey into Linux administration and cybersecurity. These scripts help automate daily system tasks, perform backups, monitor system resources, and send reports via email.

---

## 📂 Structure

BashScripts/
├── mailScript/ # Send emails to users in a list

│ ├── mailScript.sh

│ └── users.txt

│

├── backupScript/ # Backup home directory

│ └── backup-script.sh

│

├── updateSystemScript/ # Update system packages and log update history

│ └── script-update.sh

│

├── resourcesChecker/ # Monitor system resources and log usage

│ ├── rsourcesChecker.sh


---

## 🚀 How to Use

```bash
# Clone the repo
git clone https://github.com/SeifEldienAhmad/BashScripts.git
cd BashScripts/

# Example: Run system update script
cd updateSystemScript
chmod +x script-update.sh
./script-update.sh

    💡 Some scripts may require sudo privileges.

🛠 Script Descriptions
Script Folder	               Description
mailScript	        Sends emails to users listed in users.txt.
backupScript	       Creates a backup of user files (e.g., /home).
updateSystemScript	Updates system packages and logs update history.
resourcesChecker	Logs CPU/RAM usage and writes into usageLog.txt.
```
📌 Requirements

    OS: Linux (tested on Parrot OS)

    Shell: Bash 5+

    Tools used: mail, df, free, uptime, etc.

🙋 About Me

I'm Seif Eldien Ahmad Mohammad, a student of Computer Science, aspiring Red Teamer, and Linux enthusiast

🗂️ Future Plans

    Add logs rotation

    Encrypt backup archives

    Enhance resource usage script with alerts

    Support multiple OS flavors

📜 License

This repository is licensed under the MIT License.
> <sub><i>Keywords: Seif Eldien, Seif Eldin, Seif Ahmad, Seif Ahmed, Seif Mohammed, Seif Mohamed, سيف الدين, سيف احمد, سيف محمد, Bash scripting, Linux Bash scripts, Cybersecurity scripts, system automation, Linux update script, resource monitor Bash, email automation Bash, backup script Linux, Linux administration, Parrot OS scripting, Red Teamer Bash tools, MIT License, GitHub Portfolio Bash</i></sub>


---
