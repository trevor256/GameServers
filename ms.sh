#!/bin/bash
apt-get update -y && apt-get upgrade -y
apt install openjdk-17-jre screen
wget https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar
java -Xmx1G -Xms3G -jar server.jar nogui
perl -pi -e 's/eula=false/eula=true/g' eula.txt
java -Xmx1G -Xms3G -jar server.jar nogui
