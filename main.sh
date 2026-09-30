#!/usr/bin/env bash

#calls function







# Main loop for the toolset
while [ "$tool" != "0" ]; do

    # get the OS system
    if [[ "$OSTYPE" == "msys"* ]] || [[ "$OSTYPE" == "cygwin"* ]]; then
        clear


        echo "--------------------------------"
        echo $(curl -s "wttr.in/?format=3")
        echo "|" $OSTYPE "|" $HOSTNAME "|" $USER "|" $PWD "|" # This looks rough, come back to properly format it
        echo "==================================================="
        echo "Bwhite.dev's Toolset"
        echo "--------------------------------"
        echo "Toolset for Windows"
        echo "1. Activate Windows"
        echo "2. Install Common Apps using chocolatey"
        echo "3. Install Dev Tools"
        echo "4. Setup Zshrc with Starship"
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

        # setup zshrc with starship
        elif [ "$tool" == "4" ]; then
            echo "Setting up Zshrc with Starship"

            # Install Zshrc and Starship
            choco install zsh -y
            choco install starship -y

            # Set up Zshrc
            echo 'eval "$(starship init zsh)"' >> ~/.zshrc && source ~/.zshrc

            #change default shell to zsh
            chsh -s $(which zsh)

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
        echo "--------------------------------"
        echo $(curl -s "wttr.in/?format=3")
        echo "Bwhite.dev's Toolset for Mac"
        echo "--------------------------------"
        echo "1. Install Common Apps using homebrew"
        echo "2. Install Dev Tools"
        echo "3. Setup Zshrc"
        echo "0. Exit"
        echo "--------------------------------"

        # collect user's choice tool
        read -p "Enter the number of the tool you want to install: " tool

        if [ "$tool" == "1" ]; then
            echo "Installing Common Apps using homebrew"
            bash mac/commonapps.sh
            continue

        elif [ "$tool" == "2" ]; then
            echo "Installing Dev Tools"
            bash mac/devtools.sh
            continue

        elif [ "$tool" == "3" ]; then
            echo "Setting up Zshrc"
            cp zshrc ~/.zshrc
            brew install --cask font-fira-code-nerd-font -y
            brew install starship -y
            starship preset gruvbox-rainbow -o ~/.config/starship.toml --force
            echo 'eval "$(starship init zsh)"' >> ~/.zshrc && source ~/.zshrc
        fi
    fi





done


exit 0


