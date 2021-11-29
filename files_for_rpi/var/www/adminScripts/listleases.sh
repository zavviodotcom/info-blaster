#!/bin/sh 
## listleases.sh
## Displays a list of active DHCP leases
## NOTE: requires fping port to use
exec 2> /dev/null
cat /var/lib/misc/dnsmasq.leases | while read x
do
   ipaddr=$(echo $x | awk '{print $3}')
   status=$(fping $ipaddr)
   if [[ $status == *"alive"* ]]; then
      echo $x
   fi
done
