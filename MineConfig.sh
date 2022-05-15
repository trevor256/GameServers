#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt install openjdk-17-jre screen ufw rkhunter -y
sudo wget https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar
sudo echo 'eula=true' >> eula.txt
sudo ufw allow proto tcp to 0.0.0.0/0 port 22
sudo ufw allow proto tcp to 0.0.0.0/0 port 25565
echo "y" | sudo ufw enable
sudo java -Xms1024M -jar server.jar nogui
#sudo screen -S minecraft

# auto jobs 
######## back up every ?
# sudo  cp - r -t YYMMDDHHMM world backups/world_backup
# ##
######## auto start minecraft on start up
# 
# echo "#!/bin/bash java -Xmx3596M -Xms1024M -jar server.jar nogui" > start.sh
# systemctl enable start.sh
#
#
