#!/bin/bash

# Define variables
website_url="https://www.tooplate.com/zip-templates/2134_gotto_job.zip"
apache_webroot="/var/www/html"
temp_dir="/tmp/website_temp/2134_gotto_job"

sudo apt-get update

sudo apt install apache2 wget zip unzip

# Create a temporary directory
sudo mkdir -p $temp_dir

# Download the website zip file
sudo wget -P $temp_dir $website_url

# Unzip the website contents
sudo unzip $temp_dir/*.zip -d $temp_dir

# Remove the downloaded zip file
sudo rm $temp_dir/*.zip

# Remove default Apache index.html if exists
sudo rm $apache_webroot/index.html

# Move website files to Apache webroot
sudo mv $temp_dir/* $apache_webroot

# Set proper permissions
sudo chown -R apache:apache $apache_webroot

# Restart Apache to apply changes
sudo systemctl restart httpd

# Clean up temporary directory
sudo rm -r $temp_dir

sudo echo "Website deployed successfully!"
