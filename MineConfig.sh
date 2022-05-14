#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
mkdir minecraft
cd minecraft
sudo wget https://raw.githubusercontent.com/trevor256/MinecraftServer/main/StartMinecraft.sh -P /etc/init.d/
sudo chmod +x /etc/init.d/StartMinecraft.sh
sudo apt install openjdk-17-jre screen ufw -y
sudo wget https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar
sudo echo 'eula=true' >> eula.txt
sudo ufw default deny incoming
sudo ufw allow proto tcp to 0.0.0.0/0 port 22
sudo ufw allow proto tcp to 0.0.0.0/0 port 25565
sudo ufw enable -y
sudo screen -S minecraft
sudo java -Xmx3596M -Xms1024M -jar server.jar nogui

