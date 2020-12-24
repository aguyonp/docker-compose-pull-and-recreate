#!/bin/bash

####################################################
# Docker auto update containers with latest image  #
####################################################

#### /!\ You can add -y to avoid confirmations /!\

##### VARS #####
stacks_path=/YOURPATH
stacks_folders=($(ls $stacks_path))
##### VARS #####

##### FUNCTIONS #####
pulling_image () {
        echo -e "\e[32m"
        echo "Pulling lastest images if necessary"
        echo -e "\e[37m"
        for stack in "${stacks_folders[@]}"
        do
                cd $stacks_path/$stack
                docker-compose pull
        done
        echo -e "\e[39m"
}

recreate_containers () {
        echo -e "\e[32m"
        echo "Recreating containers if necessary"
        echo -e "\e[37m"
        for stack in "${stacks_folders[@]}"
        do
                cd $stacks_path/$stack
                docker-compose up -d
        done
        echo -e "\e[39m"
}
ask_yes_or_no () {
        read -p "$1 ([Y]es or [N]o): "
        case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
                y|yes) echo "yes" ;;
                *)     echo "no" ;;
        esac
}
##### FUNCTIONS #####

if [ "$1" == "-y" ]
then
        pulling_image
        recreate_containers
        echo -e "\e[36mOperation completed"
        echo -e "\e[39m"
else
        echo -e "\e[91m"
        if [[ "no" == $(ask_yes_or_no "Do you want to pull the latest images from all your stacks and then automatically recreate them if necessary?") || \
              "no" == $(ask_yes_or_no "Are you *really* sure?!") ]]
        then
                echo "Skipped."
                exit 0
        else
                pulling_image
                recreate_containers
                echo -e "\e[36mOperation completed"
                echo -e "\e[39m"
        fi
fi
