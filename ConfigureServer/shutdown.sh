#!/bin/bash

if sudo nc mc.trevor256.com 443;

then
    cp /world /backup
    curl --upload-file /backup https://transfer.sh
    systemctl poweroff
        
else

fi
