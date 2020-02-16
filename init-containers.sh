#! /bin/sh

# Author: Md Mashqur Ul Alam
# Email: mashqurulalam@gmail.com
# License: MIT

# Command & Argument golabl variables
# COMMAND=false;
# WORKSPACE=false;
# PATH=false;
# RUN_ALWAYS=false;


# Installing required Dependencies
install_dependency () {
    echo -e "\e[1;32m \nInstalling Dependencies: \e[0m" 
    apt-get install sqlite3;
}

# # Add new workspace to config
# add_new_workspace () {

# }

# # Add new project to config
# add_new_project () {

# }

# Run a single container
spin_container () {
    COMMAND=$1;
    PROJECT=$2;
    PATH='';

    if [-z PATH ]; then
        echo -e "\e[1;31m \nProject path missing for: $PROJECT \e[0m"    
        return 
    fi

    if [-z PATH ]; then
        echo -e "\e[1;31m \nProject path missing docker-compose file for: $PROJECT \e[0m"    
        return 
    fi

    echo -e "\e[1;32m \nCommand running for: $PROJECT \e[0m"
    
    cd $(eval "echo $PATH");
    case "$COMMAND" in
        'up')
            docker-compose up -d
            ;;
        'down')
            docker-compose down --remove-orphan
            ;;
        'stop')
            docker-compose stop
            ;;
        'build')
            docker-compose up --build -d
            ;;
        * )
            echo "Invalid command !"
            ;;
    esac
}

# spin_containers_by_workspace () {

# }

# spin_containers_by_project () {

# }

# spin_all_containers() {
#     for PROJECT in "${!PROJECTS[@]}";
#         do
#         run_container $COMMAND $PROJECT
#     done
# }

parse_argument () {
    echo "$1";
    
    # for arg in "$@"
    #     do
    #     COMMAND="$1";
    #     case $arg in
    #         -p|--path)
    #             COMMAND="$2";
    #             shift
    #             ;;
    #         -w|--workspace)
    #             WORKSPACE="$2"
    #             shift
    #             ;;
    #         --run-always)
    #             RUN_ALWAYS=true;
    #             shift
    #             ;;
    #         * )
    #         INVALID="$2";
    #         ;;
    #     esac
    # done
}

if [ $(id -u) = 0 ]; then
   echo "\e[1;33m \nThis script should not be run as root instead use sudo user \e[0m";
fi

if sudo true; then
    parse_argument $@;
    # echo COMMAND;
    # echo WORKSPACE;
    # echo RUN_ALWAYS;
    # echo PATH;
fi
# Script requires root permission for installing 
# sqlite3 dependency and running docker commands

# # Check if depencies already installed or not
# if ! command -v sqlite3 >/dev/null 2>&1 ; then
#     install_dependency;
# fi

# WORKSPACE="~/Workspace/dg-projects"

# declare -A PROJECTS
# PROJECTS[storeBack]="$WORKSPACE/storeback/store.deligram"
# PROJECTS[dgSupply]="$WORKSPACE/dg-supply-api"
# PROJECTS[gatekeeper]="$WORKSPACE/gatekeeper"
# PROJECTS[hercules]="$WORKSPACE/dg-hercules"

# if [ -z $1 ]; then
#     echo Containers up/down/stop/build ?
#     read COMMAND
# else
#     COMMAND=$1
# fi

# unset WORKSPACE COMMAND PROJECTS
# #echo -e "\nCurrent docker containers status:"
# echo -e "\e[1;31m \nCurrent docker containers status: \e[0m"
# docker ps

