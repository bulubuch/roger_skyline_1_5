#!/bin/bash
SUM="$(cat /42/cron.md5)"
CHECK="$(md5sum /etc/crontab)"
if [ SUM != CHECK ]
then
	md5sum /etc/crontab > /42/cron.md5
	cat /42/mail.txt | mail -s "Alert from rs1" bulubuch@gmail.com
fi
