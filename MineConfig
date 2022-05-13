#!/bin/bash
apt-get update -y && apt-get upgrade -y
wget https://raw.githubusercontent.com/trevor256/MinecraftServer/main/StartMinecraft.sh -P /etc/init.d/
chmod +x /etc/init.d/StartMinecraft.sh
apt install openjdk-17-jre screen
wget https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar
echo 'eula=true' >> eula.txt
java -Xmx1024M -Xms1024M -jar server.jar nogui

#ufw allow 25565
