#!/bin/bash
# Flush all connections in the firewall
sudo iptables -F
# Delete all chains in iptables
sudo iptables -X
# wlan0 is our wireless card. Replace with your second NIC if doing it from a server.
# This will set up our structure
sudo iptables -t mangle -N wlan0_Trusted
sudo iptables -t mangle -N wlan0_Outgoing
sudo iptables -t mangle -N wlan0_Incoming
sudo iptables -t mangle -I PREROUTING 1 -i wlan0 -j wlan0_Outgoing
sudo iptables -t mangle -I PREROUTING 1 -i wlan0 -j wlan0_Trusted
sudo iptables -t mangle -I POSTROUTING 1 -o wlan0 -j wlan0_Incoming
sudo iptables -t nat -N wlan0_Outgoing
sudo iptables -t nat -N wlan0_Router
sudo iptables -t nat -N wlan0_Internet
sudo iptables -t nat -N wlan0_Global
sudo iptables -t nat -N wlan0_Unknown
sudo iptables -t nat -N wlan0_AuthServers
sudo iptables -t nat -N wlan0_temp
sudo iptables -t nat -A PREROUTING -i wlan0 -j wlan0_Outgoing
sudo iptables -t nat -A wlan0_Outgoing -d 10.0.0.1 -j wlan0_Router
sudo iptables -t nat -A wlan0_Router -j ACCEPT
sudo iptables -t nat -A wlan0_Outgoing -j wlan0_Internet
sudo iptables -t nat -A wlan0_Internet -m mark --mark 0x2 -j ACCEPT
sudo iptables -t nat -A wlan0_Internet -j wlan0_Unknown
sudo iptables -t nat -A wlan0_Unknown -j wlan0_AuthServers
sudo iptables -t nat -A wlan0_Unknown -j wlan0_Global
sudo iptables -t nat -A wlan0_Unknown -j wlan0_temp
# forward new requests to this destination
sudo iptables -t nat -A wlan0_Unknown -p tcp --dport 80 -j DNAT --to-destination 10.0.0.1
sudo iptables -t filter -N wlan0_Internet
sudo iptables -t filter -N wlan0_AuthServers
sudo iptables -t filter -N wlan0_Global
sudo iptables -t filter -N wlan0_temp
sudo iptables -t filter -N wlan0_Known
sudo iptables -t filter -N wlan0_Unknown
sudo iptables -t filter -I FORWARD -i wlan0 -j wlan0_Internet
sudo iptables -t filter -A wlan0_Internet -m state --state INVALID -j DROP
sudo iptables -t filter -A wlan0_Internet -o eth0 -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
sudo iptables -t filter -A wlan0_Internet -j wlan0_AuthServers
sudo iptables -t filter -A wlan0_AuthServers -d 10.0.0.1 -j ACCEPT
#tbd: added following line
#sudo iptables -t filter -A wlan0_Internet -j DROP
sudo iptables -t filter -A wlan0_Internet -j wlan0_Global
#allow unrestricted access to packets marked with 0x2
sudo iptables -t filter -A wlan0_Internet -m mark --mark 0x2 -j wlan0_Known
sudo iptables -t filter -A wlan0_Known -d 0.0.0.0/0 -j ACCEPT
sudo iptables -t filter -A wlan0_Internet -j wlan0_Unknown
# allow access to DNS and DHCP
# This helps power users who have set their own DNS servers
sudo iptables -t filter -A wlan0_Unknown -d 0.0.0.0/0 -p udp --dport 53 -j ACCEPT
sudo iptables -t filter -A wlan0_Unknown -d 0.0.0.0/0 -p tcp --dport 53 -j ACCEPT
sudo iptables -t filter -A wlan0_Unknown -d 0.0.0.0/0 -p udp --dport 67 -j ACCEPT
sudo iptables -t filter -A wlan0_Unknown -d 0.0.0.0/0 -p tcp --dport 67 -j ACCEPT
sudo iptables -t filter -A wlan0_Unknown -j REJECT --reject-with icmp-port-unreachable
#allow forwarding of requests from anywhere to eth0/WAN
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
#block traffic between wlan0 clients
#sudo iptables -t filter -i wlan0_Incoming -o wlan0_Outgoing -j REJECT

#save our iptables
sudo iptables-save > /etc/iptables/rules.v4
