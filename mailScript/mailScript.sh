#!/bin/bash
#Author: Seif Eldien Ahmad - Task: automail all local users - Date: 20/7/2025

#Start

#Check if the users file exist
user_file="users.txt"
if [ ! -f "$user_file" ]
then
echo "File Not Found"
exit 1
fi
#Separating the subject and message for easier control
subject="attention"
message="checking the script"

#looping message sending for each user in the file of users
for user in $(cat "$user_file")
do
#Skipping the line which is empty
[ -z "$user" ] && continue

#Following the sending process
echo "Sending to: $user"
echo "$message" | mail -s "$subject" "$user"
echo "Sent to $user"
done

#Assurrance of sending all mails
echo "All done!"

#End

