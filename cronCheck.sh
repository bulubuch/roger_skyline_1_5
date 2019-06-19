#!/bin/bash
SUM="$(cat /home/bulu/scripts/cron.md5)"
CHECK="$(md5sum /etc/crontab)"
if [ SUM != CHECK ]
then
	md5sum /etc/crontab > /home/bulu/cron.md5
	cat /home/bulu/scripts/cronMail.txt | mail -s "Alert from rs1" bulubuch@gmail.com
fi
