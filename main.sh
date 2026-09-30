#!/usr/bin/env bash

#calls function







# Main loop for the toolset
while [ "$tool" != "0" ]; do

    # get the OS system
    if [[ "$OSTYPE" == "msys"* ]] || [[ "$OSTYPE" == "cygwin"* ]]; then
        clear


        echo "Device Info:"
        echo "--------------------------------"
        echo "|" $OSTYPE "|" $HOSTNAME "|" $USER "|" $PWD "|"
        echo "==================================================="
        echo "Bwhite.dev's Toolset"
        echo "--------------------------------"
        echo "Toolset for Windows"
        echo "1. Activate Windows"
        echo "2. Install Common Apps using chocolatey"
        echo "3. Install Dev Tools"
        echo "4. copy ssh key to vps"
        echo "0. Exit"
        echo "--------------------------------"

        # collect user's choice tool
        read -p "Enter the number of the tool you want to install: " tool

        # activate windows
        if [ "$tool" == "1" ]; then
            echo "Activating Windows"
            powershell -ExecutionPolicy Bypass -File "win/activate.ps1"
            continue

        # install common apps using chocolatey
        elif [ "$tool" == "2" ]; then
            echo "Installing Common Apps using chocolatey"
            powershell -ExecutionPolicy Bypass -File "win/commonapps.ps1"
            continue

        # install dev tools using chocolatey
        elif [ "$tool" == "3" ]; then
            echo "Installing Dev Tools"
            powershell -ExecutionPolicy Bypass -File "win/devtools.ps1"
            continue

        fi



    elif [[ "$OSTYPE" == "darwin"* ]]; then


        # Clear the screen then prepare homebrew
        # IF homebrew is not installed, install it. 
        clear
        if brew --version > /dev/null 2>&1; then
            echo "Homebrew is installed"
        else
            echo "Homebrew is not installed"
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi


        # The Menu for the toolset
        echo "Bwhite.dev's Toolset for Mac"
        echo "--------------------------------"
        echo "1. Install Common Apps using homebrew"
        echo "2. Install Dev Tools"
        echo "0. Exit"
        echo "--------------------------------"

        # collect user's choice tool
        read -p "Enter the number of the tool you want to install: " tool

        if [ "$tool" == "1" ]; then
            echo "Installing Common Apps using homebrew"
            bash mac/commonapps.sh
            continue
        fi

        elif [ "$tool" == "2" ]; then
            echo "Installing Dev Tools"
            bash mac/devtools.sh
            continue
        fi




done


exit 0


