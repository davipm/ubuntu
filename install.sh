#!/bin/bash/
#######################################
# Bash script to install apps on a new system (Ubuntu)
#######################################

sudo apt update && sudo apt full-upgrade -y

## Git ##
echo '###Installing Git..'
sudo apt-get install -y git

# Git Configuration
echo '###Congigure Git..'

echo "Enter the Global Username for Git:";
#read GITUSER;
#git config --global user.name "${GITUSER}"
git config --global user.name "Davi Pereira"

echo "Enter the Global Email for Git:";
#read GITEMAIL;
#git config --global user.email "${GITEMAIL}"
git config --global user.email "davi.p.m94@gmail.com"

echo 'Git has been configured!'
git config --list

## Curl ##
echo '###Installing Curl..###'
sudo apt install -y curl

## Wget ##
echo '###Installing Wget..###'
sudo apt install -y wget

## Node.js / NVM ##
echo '###Installing Node.js and NVM..###'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm install 'lts/*' --reinstall-packages-from=current

## Browsers ##
echo '###Installing Browsers..###'

echo '###Installing Chrome..###'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo '###Installing Brave Browser..###'
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install -y brave-browser

## Tweak Tool ##
echo '###Installing Tweak Tool..'
sudo add-apt-repository universe
sudo apt install -y gnome-tweak-tool
sudo apt install -y gnome-shell-extensions

echo '###Installing dconf-editor..'
sudo apt install -y dconf-editor

## VLC ##
echo '###Installing VLC..'
sudo apt install -y vlc

## GIMP ##
echo '###Installing GIMP###'
sudo apt install -y gimp

echo '###config dash-to-dock..'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 30 ## or 64
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface text-scaling-factor 1.03
gsettings get org.gnome.desktop.interface cursor-size 32

gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false
gsettings set org.gnome.desktop.sound event-sounds false
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.desktop.wm.preferences button-layout close,maximize,minimize:

gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'brave-browser.desktop', 'firefox.desktop', 'jetbrains-webstorm.desktop', 'jetbrains-goland.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'snap-store_ubuntu-software.desktop', 'gnome-control-center.desktop', 'gnome-system-monitor.desktop', 'xsensors.desktop', 'org.gnome.Calculator.desktop']"

## Finishing ##
echo '###Finishing...'
sudo apt upgrade -y
sudo apt autoremove -y
source ~/.bashrc
