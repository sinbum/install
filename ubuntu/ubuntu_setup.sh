#!/bin/bash

# Update and upgrade packages
sudo apt update && sudo apt upgrade -y

# Install additional drivers if necessary
# e.g. sudo ubuntu-drivers autoinstall

# Configure firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 80/tcp
sudo ufw allow 8080/tcp
sudo ufw allow 22/tcp
sudo ufw allow 10000:11000/tcp
sudo ufw allow 20000:21000/tcp
sudo ufw enable


# Install SSH server
sudo apt install -y openssh-server

# Install system monitoring tool
sudo apt install -y htop

# Configure automatic updates
sudo apt install -y unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades

# Configure locale settings
sudo dpkg-reconfigure locales
sudo dpkg-reconfigure tzdata

# Print completion message
echo "Initial setup complete."
