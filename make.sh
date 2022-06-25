#!/bin/bash
########################################
#  Author https://github.com/trevor256
#  script makes Modded minecraft server
#  Linux OS (Debian)
########################################
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
bold=$(tput bold)
normal=$(tput sgr0)

    echo "${GREEN}${bold} Installing AWS CLI..${NC}${normal}"
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

     echo "${GREEN}${bold} Installing Terraform CLI..${NC}${normal}"
     curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
     sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
     sudo apt-get update && sudo apt-get install terraform

######################## user inputs add
aws configure
mkdir terraform-aws-instances
touch terraform-aws-instances/MinecraftServer.tf
cd terraform-aws-instances
terraform init
#terraform fmt
#terraform validate
#terraform apply
#terraform destroy
