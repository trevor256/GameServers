#!/bin/bash
########################################
#  Author https://github.com/trevor256
#  script configs new minecraft server
#  Linux OS (debian)
########################################

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install openjdk-17-jre ufw -y #install Java and firewall

printf "[Unit]
Description=starts ss.sh on startup
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
WantedBy=multi-user.target" > /etc/systemd/system/script.service 
sudo systemctl enable script.service #adds systemd service to run.sh on boot

sudo curl -O https://storage256.s3.amazonaws.com/minecraft_server/downloads/forge-1.19-41.0.42-installer.jar #download minecraft server
java -jar forge-1.19-41.0.42-installer.jar --installServer
echo 'eula=true' >> eula.txt #agree to end user license agreement 
sudo curl -O https://storage256.s3.amazonaws.com/minecraft_server/downloads/AddStruct.jar
sudo curl -O https://storage256.s3.amazonaws.com/minecraft_server/downloads/BiomesOPlenty.jar
sudo curl -O https://storage256.s3.amazonaws.com/minecraft_server/downloads/lithium.jar
sudo curl -O https://storage256.s3.amazonaws.com/minecraft_server/downloads/sodium.jar
sudo curl -O https://storage256.s3.amazonaws.com/minecraft_server/downloads/TerraBlender.jar
sudo ufw allow proto tcp to 0.0.0.0/0 port 22,25565 #firewall only allows ssh and minecraft
echo "y" | sudo ufw enable
sudo bash run.sh
