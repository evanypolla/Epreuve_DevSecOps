iptables -F

iptables -X
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0.10 -o eth0.20 -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -i eth0.20 -o eth0.30 -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -i eth0.20 -o eth0.40 -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -i eth0.50 -o eth0.40 -p tcp --dport 8080 -j ACCEPT
