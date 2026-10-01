#!/usr/bin/env bash

# Set Some Variables
current_git_commit=$(git rev-parse HEAD)
weather=$(curl -s "wttr.in/?format=3")
current_os=$(uname -s)


# Simple self-update check
if [ "$(curl -s "https://api.github.com/repos/BrandosFotos/SchoolTools/commits/master" | grep '"sha":' | head -n 1 | awk -F '"' '{print $4}')" != "$current_git_commit" ]; then
    echo "An update is available for the repository. Would you like to update now?"
    read -p "Enter Y to update or N to continue without updating: " update_choice
    if [[ "$update_choice" == "Y" || "$update_choice" == "y" ]]; then
        git pull origin master
        exit 0
    fi
fi




# if darwin (macOS), set os to mac
# if mingw/msys/cygwin (Windows), set os to windows
# if linux, check for WSL, otherwise set os to linux
# if unknown, set os to unknown and fail
if [[ "$current_os" == "Darwin" ]]; then
    os="mac"
elif [[ "$current_os" == "MINGW"* || "$current_os" == "MSYS"* || "$current_os" == "CYGWIN"* ]]; then
    os="windows"

elif [[ "$current_os" == "Linux" ]]; then
    if [[ -n "${WSL_DISTRO_NAME:-}" ]] || grep -qi microsoft /proc/version 2>/dev/null; then
        os="windows" # Sneaky bastard
    else
        os="linux"
    fi
else
    os="unknown"
    echo "Unknown operating system. Exiting."
    exit 1
fi





# Main loop for the toolset
while [ "$tool" != "0" ]; do

    # get the OS system
    if [[ "$os" == "windows" ]]; then
        clear


        echo "--------------------------------"
        echo "$weather"
        echo "|" $os "|" $HOSTNAME "|" $USER "|" $PWD "|" # This looks rough, come back to properly format it
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
            powershell.exe -ExecutionPolicy Bypass -File "win/activate.ps1"
            continue

        # install common apps using chocolatey
        elif [ "$tool" == "2" ]; then
            echo "Installing Common Apps using chocolatey"
            powershell.exe -ExecutionPolicy Bypass -File "win/commonapps.ps1"
            continue

        # install dev tools using chocolatey
        elif [ "$tool" == "3" ]; then
            echo "Installing Dev Tools"
            powershell.exe -ExecutionPolicy Bypass -File "win/devtools.ps1"
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



    elif [[ "$os" == "mac" ]]; then


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
        echo "$weather"
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


