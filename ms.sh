#!/bin/bash
sudo apt-get update && sudo apt-get upgrade
sudo apt install openjdk-17-jre

sudo useradd -m -r -U -d /opt/minecraft -s /bin/bash minecraft
sudo su -l minecraft

wget https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar
java -Xms1024M -Xmx2048M -jar server.jar nogui
perl -pi -e 's/eula=false/eula=true/g' eula.txt
java -Xms1024M -Xmx2048M -jar server.jar nogui
