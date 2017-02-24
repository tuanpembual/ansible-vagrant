#!/bin/bash

if [ $# -ne "1" ]; then  
        echo "Wrong amount of arguments!"
        echo "usage: $0 project_name"
        exit
fi

if [ ! -e "./playbooks/$1.yml" ]; then  
        echo "Playbook $1.yml doesn't exist!"
        exit
fi

cp ./playbooks/$1.yml ./temp_playbook.yml

echo "All right then."

if [ $(vagrant status | grep "ansible.*running" | wc -l) -eq "1" ]; then  
        echo "Re-provisioning..."
        vagrant provision
else  
        echo "Booting up the virtual machine..."
        vagrant up --provision
fi
