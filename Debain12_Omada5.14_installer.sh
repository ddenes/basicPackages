#!/bin/bash
#--------Run as root-----------
apt-get install sudo

setnewusr="dummy"

adduser $setnewusr

usermod -aG sudo $setnewusr

newgrp sudo

reboot

#-----Run as dummy---------------

sudo apt update && sudo apt upgrade -y

sudo apt install gnupg curl wget apt-transport-https ca-certificates software-properties-common -y

sudo dpkg-reconfigure tzdata

curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] http://repo.mongodb.org/apt/debian bookworm/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo apt-get update

sudo apt-get install -y mongodb-org

sudo systemctl enable --now mongod

sudo apt-get update

sudo apt-get install openjdk-17-jre-headless -y

sudo mkdir /usr/lib/jvm/java-17-openjdk-amd64/lib/amd64

sudo ln -s /usr/lib/jvm/java-17-openjdk-amd64/lib/server /usr/lib/jvm/java-17-openjdk-amd64/lib/amd64/

sudo apt-get install jsvc -y 

sudo wget https://static.tp-link.com/upload/software/2024/202407/20240710/Omada_SDN_Controller_v5.14.26.1_linux_x64.deb

sudo dpkg -i Omada_SDN_Controller_v5.14.26.1_linux_x64.deb


#--------------Controller is installed and running at http://localhost:8088--------------------
