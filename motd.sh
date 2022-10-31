#!/bin/bash

# Creates a crob job to replace the Message of the Day with output from neofetch

source .konfigrc
sudo rm -rf /etc/motd
neofetch > ${packageDir}/motd
sudo mv ${packageDir}/motd /etc/motd