#!/bin/bash
# Disable swap file
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove
# Mount drive on RAM
sudo chmod 777 /etc/fstab
#sudo cp /tmp/etc/fstab /etc/fstab
sudo cp /tmp/etc/fstab /etc/fstab2
sudo chmod 755 /etc/fstab
# Update interfaces file to serve as wireless access point
sudo chmod 777 /etc/network
sudo chmod 777 /etc/network/interfaces
sudo cp /tmp/etc/network/interfaces /etc/network/.
sudo chmod 777 /etc/hostapd/hostapd.conf
sudo chmod 777 /etc/nginx/passwd/.htpasswd
sudo chmod 777 /var/www/advanced
sudo chmod 777 /var/www/advanced/advanced.html
sudo chmod 777 /etc/hosts
sudo chmod 777 /var/www/hotspot.html
sudo chmod 755 /infoBlaster/infoBlaster
sudo chmod 777 /var/www/admin/admin.html
sudo chmod 777 /etc/dnsmasq.conf
sudo chmod 777 /etc/nginx/nginx.conf
sudo chmod 711 /usr/bin/fping
sudo chmod ug+s /usr/bin/fping
