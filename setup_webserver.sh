#!/bin/bash

LOG_FILE="webserver_setup.log"

echo "Starting Web Server Setup..." | tee -a $LOG_FILE

# Update system packages
echo "Updating system packages..." | tee -a $LOG_FILE
sudo apt update -y >> $LOG_FILE 2>&1

# Install Nginx if not installed
if ! dpkg -l | grep -q nginx; then
    echo "Installing Nginx..." | tee -a $LOG_FILE
    sudo apt install -y nginx >> $LOG_FILE 2>&1
else
    echo "Nginx already installed." | tee -a $LOG_FILE
fi

# Create a simple web page
echo "Setting up web page..." | tee -a $LOG_FILE
sudo bash -c 'echo "<h1>Welcome to My Linux Web Server</h1>" > /var/www/html/index.html'

# Restart Nginx
echo "Restarting Nginx..." | tee -a $LOG_FILE
sudo systemctl restart nginx >> $LOG_FILE 2>&1

# Allow HTTP traffic
echo "Configuring firewall..." | tee -a $LOG_FILE
sudo ufw allow 'Nginx HTTP' >> $LOG_FILE 2>&1
sudo ufw reload >> $LOG_FILE 2>&1

echo "Web Server Setup Completed!" | tee -a $LOG_FILE
