#!/bin/bash
echo "UPDATING SYSTEM" >> /var/log/update_script.log
date >> /var/log/update_script.log
sudo apt-get update -y >> /var/log/update_script.log
sudo apt-get upgrade -y >> /var/log/update_script.log

