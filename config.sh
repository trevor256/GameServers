#!/bin/bash
########################################
#  Author https://github.com/trevor256
#  script configs new minecraft server
#  Linux OS (ubuntu)
########################################

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install openjdk-17-jre-headless ufw -y

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
sudo curl -O https://storage256.s3.amazonaws.com/minecraft_server/downloads/forge-1.19-41.0.62-installer.jar
java -jar forge-1.19-41.0.42-installer.jar --installServersudo wget -P mods https://storage256.s3.amazonaws.com/minecraft_server/downloads/jei-1.19-forge-11.0.0.206.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/Jade-1.19-forge-7.3.1.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/phosphor.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/corpse.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/cfm-7.0.0-pre31-1.19.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/AddStruct.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/lithium.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/sodium.jar
echo 'eula=true' >> eula.txt
sudo wget -P mods https://storage256.s3.amazonaws.com/minecraft_server/downloads/jei-1.19-forge-11.0.0.206.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/phosphor.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/corpse.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/cfm-7.0.0-pre31-1.19.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/AddStruct.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/lithium.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/sodium.jar
sudo ufw allow proto tcp to 0.0.0.0/0 port 22,25565
echo "y" | sudo ufw enablesudo wget -P mods https://storage256.s3.amazonaws.com/minecraft_server/downloads/phosphor.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/AddStruct.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/lithium.jar https://storage256.s3.amazonaws.com/minecraft_server/downloads/sodium.jar
sudo bash run.sh
