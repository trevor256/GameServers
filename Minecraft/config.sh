#!/bin/bash
########################################
#  Author https://github.com/trevor256
#  script configs new minecraft server
#  Linux OS (ubuntu)
########################################

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install openjdk-17-jre-headless -y

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
sudo wget -P mods https://storage256.s3.amazonaws.com/minecraft_server/downloads/phosphor.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/AddStruct.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/lithium.jar 
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp  -m tcp --dport 25565 -j ACCEPT
iptables -A INPUT -j REJECT --reject-with icmp-host-prohibited

nohup sudo bash run.sh

# tar xvf $(/bin/date +%f)Minecraft-Backup.tar.gz world
# scp backup to a location
