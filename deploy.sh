#!/bin/bash
set echo off
# Variables definitions
TOOLS="exim4 exim4-config fail2ban ssh iptables iptables-persistent sudo crontab git"
GIT_REPO="https://github.com/bulubuch/roger_skyline_1_5.git"

# Installing softwares
echo "Roger Skyline 1.5 automated deployment"
apt-get update -y
apt-get upgrade -y
echo "Installing packets used for project..."
apt-get install $TOOLS -y

# Downloading scripts and config files
echo "Downloading scripts and config files"
git clone $GIT_REPO /42/scripts
mv /42/scripts/* /42/
rm -Rf /42/scripts

# Applying config
echo "Applying config"
sh /42/firewall
sed -i 's/dhcp/static
	address 10.13.0.151/g' /etc/network/interfaces
echo "00 4 * * 0 /42/update.sh" >> /etc/crontab
echo "00 0 * * * /42/cronCheck.sh" >> /etc/crontab