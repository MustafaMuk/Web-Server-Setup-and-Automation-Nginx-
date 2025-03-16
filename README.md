# Web Server Setup and Automation (Nginx)

## Overview
This project automates the setup and configuration of an Nginx web server on a Linux machine. The script ensures the installation, setup, and configuration of Nginx while also handling firewall rules to allow HTTP traffic.

## Features
- Installs and configures **Nginx** web server
- Sets up a **basic HTML landing page**
- Automates **firewall configuration** to allow HTTP traffic
- Logs installation and setup process for debugging
- Designed for Ubuntu-based systems

## Prerequisites
Before running the script, ensure:
- You have **sudo** privileges
- Your system is updated (`sudo apt update && sudo apt upgrade -y`)
- `ufw` (Uncomplicated Firewall) is installed for firewall management

## Installation & Usage
1. Clone the repository:
   ```bash
   git clone git@github.com:MustafaMuk/Web-Server-Setup-and-Automation-Nginx.git
   cd Web-Server-Setup-and-Automation-Nginx
   ```

2. Make the script executable:
   ```bash
   chmod +x setup_webserver.sh
   ```

3. Run the script:
   ```bash
   sudo ./setup_webserver.sh
   ```

4. Verify that Nginx is running:
   ```bash
   systemctl status nginx
   ```

5. Find your server's internal IP:
   ```bash
   ip a | grep inet
   ```
   
6. Open a browser and navigate to:
   ```
   http://<your-server-ip>
   ```
   You should see: **"Welcome to My Linux Web Server"**

## Logs
All script execution details are logged in:
```bash
cat webserver_setup.log
```

## Firewall Configuration
The script ensures that HTTP traffic is allowed:
```bash
sudo ufw allow 'Nginx HTTP'
sudo ufw enable
```

## Troubleshooting
- If Nginx doesn't start:
  ```bash
  sudo systemctl restart nginx
  sudo systemctl status nginx
  ```
- If the firewall is blocking access:
  ```bash
  sudo ufw status
  ```
- If script execution fails, check logs:
  ```bash
  cat webserver_setup.log
  ```

## Future Improvements
- Add support for **SSL certificates** (Let's Encrypt)
- Automate **virtual host configurations** for multiple sites
- Implement **error handling and logging enhancements**

## Author
[Mustafa Mukhtar](https://github.com/MustafaMuk)

