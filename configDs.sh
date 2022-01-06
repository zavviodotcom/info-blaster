#!/bin/bash
sudo mkdir /var/ds
sudo mkdir /var/ds/current
sudo mkdir /var/ds/past
sudo chmod 777 /var/ds
sudo chmod 777 /var/ds/current
sudo chmod 777 /var/ds/past
sudo cp /tmp/home/pi/infoBlasterDS.sh /home/pi/.
sudo chmod 777 /home/pi/infoBlasterDS.sh
sudo chmod 777 /etc/rc.local
sudo cp /tmp/etc/rc.local /etc/.
sudo chmod 755 /etc/rc.local
