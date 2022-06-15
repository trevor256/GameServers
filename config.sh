#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt install openjdk-17-jre ufw -y

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

sudo wget https://raw.githubusercontent.com/trevor256/MinecraftServer/main/script.service -P /etc/systemd/system/
sudo wget https://launcher.mojang.com/v1/objects/e00c4052dac1d59a1188b2aa9d5a87113aaf1122/server.jar
echo 'eula=true' >> eula.txt
echo -e '#!/bin/bash\nsudo cp -u /world backup\nsudo java -Xms1024M -jar server.jar nogui ' > start.sh
echo -e '#!/bin/bash\nsudo cp -u /world backup && sudo bash backup.sh\nsudo java -Xms1024M -jar server.jar nogui ' > start.sh
# Uploads world Backup to a S3 bucket, specify your bucket location, or ignore for no off server backup
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install
# 
sudo systemctl enable script.service
sudo ufw allow proto tcp to 0.0.0.0/0 port 22 25565
echo "y" | sudo ufw enable
sudo bash start.sh &
