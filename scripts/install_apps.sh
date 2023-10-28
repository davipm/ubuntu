#!/bin/bash

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root (sudo)."
  exit 1
fi

# Define the file containing the list of apt-installed apps
apt_list_file="applist.txt"

# Define the file containing the list of Flatpak apps
flatpak_list_file="flatpaklist.txt"

# Update the package list and upgrade existing packages
apt update
apt upgrade -y

# Install apt-installed apps listed in applist.txt
while IFS= read -r app; do
  echo "Installing $app..."
  apt install -y "$app"
  if [ $? -eq 0 ]; then
    echo "$app installed successfully."
  else
    echo "Failed to install $app."
  fi
done < "$apt_list_file"

# Install Flatpak apps listed in flatpaklist.txt
while IFS= read -r app; do
  echo "Installing $app..."
  flatpak install -y flathub "$app"
  if [ $? -eq 0 ]; then
    echo "$app installed successfully."
  else
    echo "Failed to install $app."
  fi
done < "$flatpak_list_file"

echo "All apps installed."

# Clean up by removing unnecessary packages
apt autoremove -y
