#!bin/bash

file=/usr/bin/terraform

if [ -e "$file" ]; then
    terraform  -v

    echo "Installing AWS provider modules"
    terraform init

    echo 
    echo "Infrastructure setup"
    terraform plan

    echo "extracted plan to infrastructure.plan"
    terraform plan -out terraform.plan

    while true; do
        read -p "Build this on AWS?" yn
        case $yn in
            [Yy]* ) terraform apply; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done



else 
    echo "please check if the terraform is installed here"

fi 