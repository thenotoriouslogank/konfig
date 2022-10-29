#!/bin/bash

# A system configuration tool for Logank's personal systems.

source ./.konfigrc

verify() {
    # Inform the user that the actions they're undertaking may have
    # consequences.
    clear
    echo "Welcome to Konfigure."
    echo "This application will make changes to currently installed "
    echo "software, as well as creating, moving, and editing of files "
    echo "and/or other applications on the system."
    echo "Would you like to proceed?"
    echo ""
    select Yn in "Yes" "No" ; do
        case $yn in
            Yes ) prepare; break;;
            No ) exit;;
        esac
    done
}

prepare() {
    # Ensure the system is up-to-date with currently installed software
    echo ""
    echo "Updating currently installed software."
    echo "If this is a newly-installed system, this may take a few minutes."
    echo ""
    apt update && apt upgrade -y
}

checkInstalls() {

}

doInstalls(){

}

sysConfig() {

}

makeDatasheet() {

}

main() {
    verify
}

main

# TODO: .konfigrc
# TODO: Update package manager
# TODO: Install packages
# TODO: Generate system info datasheet
# TODO: Configure SSH, screen, plex, whatever else
# TODO: Create basic I/O menus? 