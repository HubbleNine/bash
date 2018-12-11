#!/bin/bash
#Title: logparser.sh
#Author: Me | Senior Network Engineer
#Date: 12/11/2018
#This script is designed to be run from crontab at some frequency and look for a particular string
#in whatever log you need

string=foobar

tail -n 50 /var/log/somelog | \
while read LINE
do
  if echo "$LINE" | grep "$string" 1>/dev/null 2>&1
  then
    printf "Bounce found on $HOSTNAME:\n\n$LINE" | mailx -s "Bounced Email on SMTPRelay" -r "SenderName<sendername@domain.com>" recipient@domain.com
  fi
done
