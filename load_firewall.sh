#!/bin/sh
THIS_SERVER_IP='192.168.56.101'
iptables --flush

# default DROP for inbound and forward chains
iptables --policy INPUT DROP
iptables --policy OUTPUT ACCEPT
iptables --policy FORWARD DROP

# --------enable loopback
iptables -I INPUT  -j ACCEPT -i lo
iptables -I OUTPUT -j ACCEPT -o lo

# --------state  checks
# -allow established and related traffic
iptables -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED

# --------HTTP and HTTPS
# - be able to access HTTPD server
# - specify this rule for both interfaces
iptables -A INPUT -j ACCEPT -m state --state NEW -p tcp -m multiport --dports 80,443,9090

# --------enable incoming and outgoing SSH
# - check for legitimate SSH traffic using state
# - specify interface (no blanket interface)
iptables -A INPUT  -j ACCEPT -m state --state NEW -i enp0s8 -p tcp --dport 22
iptables -A OUTPUT -j ACCEPT -m state --state NEW -o enp0s8 -p tcp --sport 22

# --------enable mailing protocols and name resolution
iptables -A INPUT  -j ACCEPT -m state --state NEW -p tcp --dport 25   	# SMTP
iptables -A INPUT  -j ACCEPT -m state --state NEW -p udp --dport 53     # DNS
iptables -A OUTPUT -j ACCEPT -m state --state NEW -p udp --dport 53	# DNS

# --------block two insecure protocols
iptables -A INPUT -j DROP -m state --state NEW -p tcp --dport 23	# Telnet
iptables -A INPUT -j DROP -m state --state NEW -p udp --dport 161	# SNMP
iptables -A INPUT -j DROP -m state --state NEW -p udp --dport 162	# SNMP
iptables -A INPUT -j DROP -m state --state NEW -p tcp --dport 162	# SNMP

# --------prevent users from being able to access Facebook and Yahoo
iptables -A OUTPUT -j DROP -m state --state NEW -d 31.13.69.228	 	# Facebook
iptables -A OUTPUT -j DROP -m state --state NEW -d 98.139.180.109	# Yahoo
iptables -A OUTPUT -j DROP -m state --state NEW -d 98.139.180.149	# Yahoo
iptables -A OUTPUT -j DROP -m state --state NEW -d 209.190.36.45	# Yahoo

# --------prevent users from traceroute, netstat, ping (1 rule)
iptables -A INPUT -j DROP -p icmp --icmp-type echo-request

# --------prevent DoS attack 
# - source and dest should not be same
# - limit number of connections on port 80
iptables -A INPUT -j DROP -i enp0s8 -s ${THIS_SERVER_IP} 
iptables -A INPUT -j ACCEPT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 100

# --------deny NEW and INVALID
iptables -A INPUT -j DROP -m state --state NEW,INVALID

# --------TCP catch-alls for input and output chains
#iptables -A INPUT  -j DROP -p tcp
#iptables -A OUTPUT -j DROP -p tcp

# --------make rules persistent upon logoff
service iptables save
