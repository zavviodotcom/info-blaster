#!/bin/bash
sudo cp /tmp/etc/dnsmasq.conf /etc/.
sudo cp /tmp/etc/dhcpcd.conf /etc/.
sudo cp /tmp/etc/hosts /etc/.
sudo cp /tmp/etc/init.d/hostapd /etc/init.d/.
sudo cp /tmp/etc/network/interfaces.d/* /etc/network/interfaces.d/.
sudo cp /tmp/etc/sysctl.conf /etc/.
sudo cp /tmp/etc/hostapd/hostapd.conf /etc/hostapd/.
sudo cp /tmp/etc/default/hostapd /etc/default/.
sudo cp /tmp/etc/php/7.3/fpm/php.ini /etc/php/7.3/fpm/.
sudo cp /tmp/etc/php/7.3/fpm/pool.d/www.conf /etc/php/7.3/fpm/pool.d/.
sudo cp /tmp/etc/nginx/sites-available/* /etc/nginx/sites-available/.
sudo cp /tmp/etc/wpa_supplicant/* /etc/wpa_supplicant/.
sudo cp /tmp/usr/bin/* /usr/bin/.
sudo chmod 600 /etc/wpa_supplicant/wpa_supplicant.conf
sudo chmod 777 /var/www
sudo mkdir /var/www/_
sudo mkdir /var/www/past
sudo mkdir /var/www/admin
sudo mkdir /var/www/adminDS
sudo mkdir /var/www/adminScripts
sudo mkdir /var/www/instructions
sudo mkdir /var/www/instructionsDS
sudo mkdir /var/www/viewSetTime
sudo mkdir /var/www/advanced
sudo chmod 777 /var/www/_
sudo chmod 777 /var/www/past
sudo chmod 777 /var/www/admin
sudo chmod 777 /var/www/adminDS
sudo chmod 777 /var/www/adminScripts
sudo chmod 777 /var/www/instructions
sudo chmod 777 /var/www/instructionsDS
sudo chmod 777 /var/www/viewSetTime
sudo chmod 777 /var/www/advanced
sudo chmod 755 /usr/bin/fbi
sudo cp /tmp/var/www/_/* /var/www/_/.
sudo cp /tmp/var/www/past/* /var/www/past/.
sudo cp /tmp/var/www/admin/* /var/www/admin/.
sudo cp /tmp/var/www/adminDS/* /var/www/adminDS/.
sudo cp /tmp/var/www/adminScripts/* /var/www/adminScripts/.
#change listleases.sh to executable?
sudo chmod 755 /var/www/adminScripts/listleases.sh
sudo cp /tmp/var/www/instructions/* /var/www/instructions/.
sudo cp /tmp/var/www/instructionsDS/* /var/www/instructionsDS/.
sudo cp /tmp/var/www/viewSetTime/* /var/www/viewSetTime/.
sudo cp /tmp/var/www/readId/* /var/www/readId/.
sudo cp /tmp/var/www/advanced/* /var/www/advanced/.
sudo cp /tmp/var/www/index.php /var/www/.
sudo cp /tmp/var/www/index.html /var/www/.
sudo cp /tmp/var/www/hotspot.html /var/www/.
sudo chmod 777 /var/www/_
sudo chmod 777 /var/www/past
sudo chmod 755 /var/www/admin
sudo chmod 755 /var/www/adminDS
sudo chmod 755 /var/www/adminScripts
sudo chmod 755 /var/www/instructions
sudo chmod 755 /var/www/instructionsDS
sudo chmod 755 /var/www/viewSetTime
sudo chmod 777 /var/www/index.php
sudo chmod a+w /var/www
sudo cp /tmp/etc/nginx/nginx.conf /etc/nginx/.
