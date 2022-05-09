#!/bin/bash
apt-get update -y && apt-get upgrade -y
apt install openjdk-17-jre screen
wget https://storage256.s3.amazonaws.com/minecraft_server/forge-1.18-38.0.17-installer.jar
java -jar forge-1.18-38.0.17-installer.jar --installServer
java -Xms1024M -Xmx3096M -jar forge-1.18-38.0.17-installer.jar nogui  
perl -pi -e 's/eula=false/eula=true/g' eula.txt
java -Xms1024M -Xmx3096M -jar forge-1.18-38.0.17-installer.jar nogui  
