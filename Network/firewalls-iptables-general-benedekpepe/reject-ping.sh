#/bin/sh
# Leave this command here
sudo iptables -F
# Write your commands after this comment

sudo iptables -A INPUT -p icmp --icmp-type echo-request -j REJECT
sudo iptables -A OUTPUT -p icmp --icmp-type echo-reply -j REJECT

