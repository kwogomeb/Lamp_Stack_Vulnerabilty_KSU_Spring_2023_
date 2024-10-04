#!/bin/bash

# Update the package list
sudo apt-get update

# Install Apache
sudo apt-get install -y apache2

# Install MySQL
sudo apt-get install -y mysql-server

# Install PHP
sudo apt-get install -y php libapache2-mod-php php-mysql

# Set up MySQL (you can customize root password)
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'password';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Enable Apache and MySQL to start on boot
sudo systemctl enable apache2
sudo systemctl enable mysql

# Create a sample PHP page
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

# Restart Apache to apply changes
sudo systemctl restart apache2
