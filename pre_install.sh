#!/bin/bash

## Install Flatpak ##
echo '###Install Flatpak..###'
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

## Tweak Tool ##
echo '###Installing Tweak Tool..'
sudo add-apt-repository universe

## Icons ##
echo '###Installing Icons###'
sudo add-apt-repository ppa:numix/ppa
sudo apt install numix-icon-theme-circle
