#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt install openjdk-17-jre screen ufw rkhunter -y
sudo wget https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar
sudo wget https://raw.githubusercontent.com/trevor256/MinecraftServer/main/ss.sh
sudo wget https://raw.githubusercontent.com/trevor256/MinecraftServer/main/script.service -P /etc/systemd/system/
sudo echo 'eula=true' >> eula.txt
sudo ufw allow proto tcp to 0.0.0.0/0 port 22
sudo ufw allow proto tcp to 0.0.0.0/0 port 25565
echo "y" | sudo ufw enable
sudo systemctl enable script.service
sudo java -Xms1024M -jar server.jar nogui
