#!/bin/bash/
#######################################
# Bash script to install apps on a new system (Ubuntu)
#######################################

## Git ##
echo '###Installing Git..'
sudo apt-get install git -y

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
echo '###Installing Curl..'
sudo apt install curl -y
sudo apt update
curl --version

## Node.js / NVM ##
echo '###Installing Node.js and NVM..'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
sudo apt update
nvm list-remote
nvm install lts/fermium
node -v

## Browsers ##
echo '###Installing Browsers..'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt update
sudo dpkg -i google-chrome-stable_current_amd64.deb

## Tweak Tool ##
echo '###Installing Tweak Tool..'
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
sudo apt install gnome-shell-extensions
sudo apt update

echo '###Installing dconf-editor..'
sudo apt install dconf-editor
sudo apt update

## VLC ##
echo '###Installing VLC..'
sudo apt remove vlc
sudo snap install vlc
sudo apt update

## Webstorm ##
echo '###Installing Webstorm'
sudo apt remove webstorm --classic
sudo snap install webstorm --classic

echo '###config dash-to-dock..'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 30 ## or 64
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true

# Set up the desktop environment
cp ./img/desktop.jpg ~/desktop.jpg
cp ./img/lock.jpg ~/lock.jpg
dconf load /org/gnome/ < ../../settings.dconf

gsettings set org.gnome.desktop.sound event-sounds false
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.wm.preferences button-layout close,maximize,minimize:

gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'brave-browser.desktop', 'firefox.desktop', 'jetbrains-webstorm.desktop', 'jetbrains-goland.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'snap-store_ubuntu-software.desktop', 'gnome-control-center.desktop', 'gnome-system-monitor.desktop', 'xsensors.desktop', 'org.gnome.Calculator.desktop']"

## Finishing ##
echo '###Finishing...'
sudo apt update && sudo apt upgrade
sudo apt autoremove -y
source ~/.bashrc

# Fun hello
figlet "... Hello Weeabo!" | lolcat
