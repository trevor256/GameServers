#!/bin/bash
########################################
#  Author https://github.com/trevor256
#  script configs new minecraft server
#  Linux OS (ubuntu)
########################################

sudo apt-get update -y && sudo apt-get update 
sudo apt install openjdk-17-jre-headless -y

printf "[Unit]
Description=starts run.sh on startup
Wants=network.target
After=network.target

[Service]
Nice=5
KillMode=control-group
SuccessExitStatus=0 1
ReadWriteDirectories=/home/admin/
WorkingDirectory=/home/admin/
ExecStart=/home/admin/run.sh

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/startm.service 

sudo systemctl enable startm.service
sudo curl -O https://storage256.s3.amazonaws.com/minecraft_server/downloads/forge-1.19.1-42.0.1-installer.jar
java -jar forge-1.19.1-42.0.1-installer.jar --installServer
echo 'eula=true' >> eula.txt
sudo wget -P mods https://storage256.s3.amazonaws.com/minecraft_server/downloads/AddS1.19.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/lithium-1.19.1.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/Clumps-forge-1.19.1.jar 
sudo iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp  -m tcp --dport 25565 -j ACCEPT
sudo iptables -A INPUT -j REJECT --reject-with icmp-host-prohibited

sudo bash run.sh &

# aws configure
# aws s3 cp --recursive world s3://storage256/minecraft_server/backups/world
# aws s3 sync s3://storage256/minecraft_server/backups/ .
# Welcome to \u00A72mc.trevor256.com\n\u00A7c\u00A7lRule \u00A7fNo destroying or stealing from other bases
