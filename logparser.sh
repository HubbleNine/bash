#!/bin/bash
#Title: logparser.sh
#Author: Me | Senior Network Engineer
#Date: 12/11/2018
#This script is designed to be run from crontab at some frequency and look for a particular string
#in whatever log you need, then send that log line via email to someone

#replace for whichever string you want to parse the logs for
string=foobar

#replace 'somelog' with the log name you want to parse
tail -n 50 /var/log/somelog | \
while read LINE
do
  if echo "$LINE" | grep "$string" 1>/dev/null 2>&1
  then
	#replace Subject Line, SenderName, sendername@domain, and recipient@domain with your entries
    printf "Bounce found on $HOSTNAME:\n\n$LINE" | mailx -s "Subject Line" -r "SenderName<sendername@domain.com>" recipient@domain.com
  fi
done
