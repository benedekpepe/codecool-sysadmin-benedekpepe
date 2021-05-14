#/bin/sh
# Leave this command here
sudo iptables -F
# Write your commands after this comment

sudo iptables -A INPUT -p tcp -s 192.168.0.1 --dport 22 -j ACCEPT
