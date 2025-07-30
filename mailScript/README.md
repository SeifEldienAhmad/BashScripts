# AutoMail Local Users Script

### Author:
**Seif Eldien Ahmad Mohammad**

### Date:
20/07/2025

---

## 📝 Description

This Bash script automates sending a predefined email message to a list of local users. It's especially useful for system administrators who need to notify multiple users quickly — such as alerting about maintenance, policy changes, or system warnings.

---

## 📌 How It Works

- It reads usernames from a file named `users.txt`.
- Sends each user a simple message via the `mail` command.
- Skips any empty lines in the file.
- Notifies the admin through the terminal as it sends each email.
- Confirms when all emails are sent.

---

## 📂 Files

- `users.txt`: A plain text file where each line contains one local username (no emails, just usernames).
- `automail.sh`: The Bash script file.

---

## 📋 Requirements

- Ensure the `mail` utility is installed and configured correctly (e.g., `mailutils` on Debian/Ubuntu).
- The usernames listed in `users.txt` must correspond to actual local user accounts on the system.
- The system should be able to send local emails (via `postfix`, `sendmail`, or similar MTA).

---

## 🚀 Usage

1. Create a file named `users.txt` and list each username on a separate line.
2. Make the script executable:

   ```bash
   chmod +x automail.sh

    Run the script:

    ./automail.sh

📌 Notes

    You can customize the subject and message variables inside the script to change the content.

    This script is for local user messaging. If you want to send messages to external email addresses, you’ll need to modify the logic accordingly.

<sub><i>Keywords: Seif Eldien, Seif Eldin, Seif El Dien, Seif El Din, Seif Ahmad, Seif Ahmed, Seif Mohamed, Seif Mohammad, Seif Mohammed, Saif Eldien, Saif Eldin, Saif Ahmad, Saif Ahmed, Saif Mohammed, Saif Mohamed, سيف الدين, سيف احمد, سيف محمد, Cybersecurity, Linux Administration, Bash Script, Email Automation, User Management, Mailutils, Local User Alert, System Notification, GitHub Portfolio</i></sub>


---
