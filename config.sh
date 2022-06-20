#!/bin/bash
########################################
#  Author https://github.com/trevor256
#  script configs new minecraft server
#  Linux OS (debian)
########################################

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install openjdk-17-jre ufw -y ##rminstall Java and firewall

echo -e '#!/bin/bash\nsudo cp -u -r world backup\nsudo java -Xms1024M -jar server.jar nogui &' > start.sh ##adds script to backup world and run minecraft
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
ExecStart=/home/admin/start.sh

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/script.service 
sudo systemctl enable script.service ##adds systemd service to run start.sh on boot

sudo wget https://launcher.mojang.com/v1/objects/e00c4052dac1d59a1188b2aa9d5a87113aaf1122/server.jar ##download minecraft server
echo 'eula=true' >> eula.txt ##agree to end user license agreement 

sudo ufw allow proto tcp to 0.0.0.0/0 port 22 25565 ##firewall only allows ssh and minecraft
echo "y" | sudo ufw enable
sudo bash start.sh &
