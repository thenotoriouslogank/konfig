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
                [yY])
                        echo "Updating currently installed software." && prepare
                        break
                        ;;
                [nN])
                        echo "Exiting"
                        exit
                        ;;
                *) echo "Invalid response." ;;
                esac
        done
}

prepare() {
        # Ensure the system is up-to-date with currently installed software
        echo ""
        echo "If this is a newly-installed system, this may take a few minutes."
        echo ""
        mkdir backups
        cd backups
        apt update && apt upgrade -y && doInstalls
}

doInstalls() {
        echo ""
        apt install "${applications[@]}" -y
        echo ""
        echo "Installation(s) complete.  Some files have been"
        echo "automatically removed via apt autoremove."
        echo ""

        while true; do

                read -p "Would you like to install Microsoft Visual Studio Code? [y/n] " yn

                case $yn in
                [yY])
                        echo "Installing VSCode..." &&
                                vscode
                        break
                        ;;
                [nN])
                        echo "Skipping VSCode install."
                        break
                        ;;
                *) echo "Invalid response." ;;
                esac
        done

        echo ""

        while true; do

                read -p "Would you like to install GitHub Command Line Interface? [y/n] " yn

                case $yn in
                [yY])
                        echo "Installing gh..." && gh
                        break
                        ;;
                [nN])
                        echo "Skipping gh install."
                        break
                        ;;
                *) echo "Invalid response." ;;
                esac
        done

        echo ""
        echo "Cleaning up. . ."
        echo ""

        while true; do

                read -p "Would you like to continue? [y/n] " yn

                case $yn in
                [yY])
                        echo "Konfigure will now setup certain system parameters" && sysConfig
                        break
                        ;;
                [nN])
                        echo "Exiting"
                        exit
                        ;;
                *) echo "Invalid response." ;;
                esac
        done
}

sysConfig() {
        source ../.konfigrc
        sshSetup
        # TODO: Generalize the ~/.ssh/config file to use a variable rather
        # than hardcoding the username.
        echo "SSH has been configured.  Please see ~/.ssh/config and /etc/ssh/sshd_config "
        echo "for more information.  Original SSH settings can be recovered from ./backups."
        echo ""
        
        
        # makeDatasheet
}

makeDatasheet() {
        return 1
}

main() {
        verify
}

main