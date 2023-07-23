#!/bin/bash

# Update and upgrade packages
apt update && apt upgrade -y

# Install additional drivers if necessary
# e.g. ubuntu-drivers autoinstall

# Configure firewall
ufw default deny incoming
ufw default allow outgoing
ufw allow 80/tcp
ufw allow 8080/tcp
ufw allow 22/tcp
ufw allow 10000:11000/tcp
ufw allow 20000:21000/tcp
ufw enable


# Install SSH server
apt install -y openssh-server

# Install system monitoring tool
apt install -y htop

# Configure automatic updates
apt install -y unattended-upgrades
dpkg-reconfigure -plow unattended-upgrades

# Configure locale settings
dpkg-reconfigure locales
dpkg-reconfigure tzdata

# Print completion message
echo "Initial setup complete."
