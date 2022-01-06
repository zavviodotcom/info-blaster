#!/bin/sh
# Make the HTML Document Root
#sudo mkdir /usr/share/nginx/html/portal
#chown nginx:www-data /usr/share/nginx/html/portal
#sudo chown www-data /usr/share/nginx/html/portal
#sudo chmod 755 /usr/share/nginx/html/portal
sudo chown www-data /var/www

sudo chmod 777 /etc/nginx/passwd/.htpasswd
sudo chmod 777 /etc/nginx/passwd

# Enable the website and reload nginx
sudo ln -s /etc/nginx/sites-available/hotspot.conf /etc/nginx/sites-enabled/hotspot.conf
sudo ln -s /etc/nginx/sites-available/admin.conf /etc/nginx/sites-enabled/admin.conf
sudo rm /etc/nginx/sites-enabled/default
sudo touch /etc/nginx/sites-available/hotspot.conf
#sudo systemctl reload nginx
