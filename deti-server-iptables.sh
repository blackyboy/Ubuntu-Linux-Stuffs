#!/bin/bash
set -x

# Default filter

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP	

# Loopback allows all.

iptables -I INPUT -i lo -j ACCEPT
iptables -I FORWARD -i lo -j ACCEPT

# Null packets are, simply said, recon packets. see how we configured the VPS and find out weaknesses.

iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# Reject is a syn-flood attack

iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# XMAS packets, also a recon packet

iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

# Allow all Outgoing connection

iptables -A OUTPUT -j ACCEPT

# Ethernet allows established/related Except invalid.

iptables -A INPUT -i em+ -m state --state ESTABLISHE,RELATED -j ACCEPT
iptables -A INPUT -i em+ -m state --state INVALID -j DROP

# Allow TCP on Port 2002 SSH with rate limiting

iptables -A INPUT -i em+ -p tcp --dport 2002 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -I INPUT -i em+ -p tcp -m state --state NEW -m tcp --dport 2002 -m recent --set
iptables -I INPUT -i em+ -p tcp -m state --state NEW -m tcp --dport 2002 -m recent --update --seconds 10 --hitcount 5 -j DROP

# Allow Ping ICMP echo With Limiting

iptables -A INPUT -i em+ -p icmp -m state --state NEW -m icmp --icmp-type echo-request -j ACCEPT
iptables -I INPUT -i em+ -p icmp -m icmp --icmp-type echo-request -m recent --set
iptables -I INPUT -i em+ -p icmp -m icmp --icmp-type echo-request -m recent --update --seconds 10 --hitcount 10 -j DROP

# Allow HTTP Requests for NON-secured 80

iptables -A INPUT -i em+ -p tcp --dport 80 -m state --state NEW -m tcp -j ACCEPT
iptables -I INPUT -i em+ -p tcp --dport 80 -m state --state NEW -m recent --set
iptables -I INPUT -i em+ -p tcp --dport 80 -m state --state NEW -m recent --update --seconds 5 --hitcount 20 -j DROP

# Allow HTTP Requests for SLL 443

iptables -A INPUT -i em+ -p tcp --dport 443 -m state --state NEW -m tcp -j ACCEPT
iptables -I INPUT -i em+ -p tcp --dport 443 -m state --state NEW -m recent --set
iptables -I INPUT -i em+ -p tcp --dport 443 -m state --state NEW -m recent --update --seconds 5 --hitcount 20 -j DROP

# Enabling Logging

iptables -N LOGGING
iptables -A INPUT -j LOGGING
iptables -A OUTPUT -j LOGGING
iptables -A LOGGING -m limit --limit 10/min -j LOG --log-prefix "IPTables-log:" --log-level 4
iptables -A LOGGING -j DROP

# DROP ALL Except Above Rules

iptables -A INPUT -j DROP
