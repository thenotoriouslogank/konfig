#!/bin/bash

# A system configuration tool for Logank's personal systems.

source .konfigrc

verify() {
    # Inform the user that the actions they're undertaking may have
    # consequences.
    clear
    echo "Welcome to Konfigure."
    echo ""
    echo "This application will make changes to currently installed "
    echo "software, as well as creating, moving, and editing of files "
    echo "and/or other applications on the system."
    echo ""
 
    while true; do

    read -p "Would you like to continue? [y/n] " yn

    case $yn in
            [yY] ) echo "Updating currently installed software." && prepare;
                    break;;
            [nN] ) echo "Exiting";
                    exit;;
            * ) echo "Invalid response.";;
    esac
    done 
}

prepare() {
    # Ensure the system is up-to-date with currently installed software
    echo ""
    echo "If this is a newly-installed system, this may take a few minutes."
    echo ""
    apt update && apt upgrade -y && doInstalls
}

doInstalls() {
    echo ""
    apt install "${applications[@]}"
    echo ""
    echo "Installation(s) complete.  Some files have been"
    echo "automatically removed via apt autoremove."
    echo ""

    while true; do

    read -p "Would you like to install Microsoft Visual Studio Code? [y/n] " yn

    case $yn in
            [yY] ) echo "Installing VSCode..."  \
                    && vscode;
                    break;;
            [nN] ) echo "Skipping VSCode install.";
                    break;;
            * ) echo "Invalid response."
    esac
    done

    echo ""

    while true; do

    read -p "Would you like to install GitHub Command Line Interface? [y/n] " yn

    case $yn in
            [yY] ) echo "Installing gh..." && gh
                    break;;
            [nN] ) echo "Skipping gh install.";
                    break;;
            * ) echo "Invalid response."
    esac
    done

    echo ""
    echo "Cleaning up. . ."
    echo ""


    while true; do

    read -p "Would you like to continue? [y/n] " yn

    case $yn in
            [yY] ) echo "Konfigure will now setup certain system parameters" && sysConfig;
                    break;;
            [nN] ) echo "Exiting";
                    exit;;
            * ) echo "Invalid response.";;
    esac
    done
}

sysConfig() {
    echo ""
    echo "Setting up SSH config files..."
    echo ""
    echo "Setting up .zshrc..."
    echo ""
    echo "Setting up screen..."
    echo ""
    makeDatasheet
}

makeDatasheet() {
    PASS
}

main() {
    verify
}

main

# TODO: Generate system info datasheet
# TODO: Configure SSH, screen, plex, whatever else
# TODO: Create basic I/O menus? 