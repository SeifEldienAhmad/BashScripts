#!/bin/bash
# Author: Seif Eldien Ahmad - Task: Backup comprissed /etc to /backup - Date: 18/7/2025

#Start

#Checks if you are root user, if yes make the backup
if [ "$(id -u)" -eq 0 ]
then

#Make the backup with unique name to keep the history of backups
backupName="etc_backup_$(date '+%Y-%m-%d_%H-%M-%S').tgz"
tar -czf "$backupName" /etc

#Checks if the directory backup existed to move the backup file to it, if not it creates it then moves the file
if [ -d "$HOME/backup" ]
then
mv "$backupName" "$HOME/backup/"
else
mkdir -p "$HOME/backup"
mv "$backupName" "$HOME/backup"
fi

#Keeps the date of the last update
echo "Backup has been done at: $(date '+%Y-%m-%d  %H:%M:%S')" >> "$HOME/backup/backupHistory.txt"

else
#Asks the user to run the script as root if he's not
echo "run this as root, please!"
fi

#END
