#!/bin/bash

# Install Apache
sudo apt update
sudo apt install -y apache2

# Determine current public and private IP address using AWS CLI
public_ip_address=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
private_ip_address=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

# Create HTML file with IP address
sudo bash -c 'cat  > /var/www/html/index.html' <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Web Server, Created by Terraform with file user_data.sh</title>
</head>
<body>
    <h1>Apache Server, Created by Terraform with file user_data.sh, and change again and again</h1> 
    <h3>Public IP: ${public_ip_address}</h3>
    <h3>Privat IP: ${private_ip_address}</h3>
</body>
</html>
EOF

# Restart Apache to apply changes
sudo systemctl restart apache2