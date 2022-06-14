#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt install openjdk-17-jre ufw -y
sudo wget https://raw.githubusercontent.com/trevor256/MinecraftServer/main/script.service -P /etc/systemd/system/
sudo wget https://launcher.mojang.com/v1/objects/e00c4052dac1d59a1188b2aa9d5a87113aaf1122/server.jar
echo -e '#!/bin/bash\nsudo java -Xms1024M -jar server.jar nogui' > start.sh
echo 'eula=true' >> eula.txt
sudo ufw allow proto tcp to 0.0.0.0/0 port 22 25565
echo "y" | sudo ufw enable
sudo systemctl enable script.service
sudo bash start.sh &
