# MinecraftServer

***ConfigureServer/*  has the files that configure the minecraftserver.**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run command on linux server to install, run, and config a minecraftserver
```
curl -L https://raw.githubusercontent.com/trevor256/MinecraftServer/main/ConfigureServer/ConfigMinecraftServer.sh -o cs.sh && sudo sh cs.sh
```

<br/><br/>

***MakeServer/*  has the files needed to build a linux cloud server in AWS if you don't have one.**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*(NEED AWS ACCOUNT AND IAM CREDENTIALS)* run command on computer to make a cloud server using AWS CLI and terraform CLI
```
curl -L https://raw.githubusercontent.com/trevor256/MinecraftServer/main/MakeServer/BuildCloudServer.sh -o ms.sh && sudo sh ms.sh
```

