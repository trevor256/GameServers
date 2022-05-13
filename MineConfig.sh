#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
sudo wget https://raw.githubusercontent.com/trevor256/MinecraftServer/main/StartMinecraft.sh -P /etc/init.d/
sudo chmod +x /etc/init.d/StartMinecraft.sh
sudo apt install openjdk-17-jre screen
sudo wget https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar
sudo echo 'eula=true' >> eula.txt
sudo java -Xmx1024M -Xms1024M -jar server.jar nogui

#ufw allow 25565
