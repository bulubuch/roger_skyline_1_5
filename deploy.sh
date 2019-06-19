#!/bin/bash
set echo off
# Variables definitions
TOOLS="exim4 exim4-config fail2ban ssh iptables iptables-persistent sudo crontab git"
GIT_REPO="https://github.com/bulubuch/roger_skyline_1_5.git"
echo "Roger Skyline 1.5 automated deployment"
sudo apt-get update -y
sudo apt-get upgrade -y
echo "Installing packets used for project..."
sudo apt-get install $TOOLS -y
git clone $GIT_REPO /tmp/scripts