#!/bin/bash

# Flush the Existing Rules

iptables -F

# Delete the chain

iptables -X

# set the default change to DROP

iptables -P INPUT DROP

iptables -P FORWARD DROP

iptables -P OUTPUT DROP

# Null packets are, simply said, recon packets. see how we configured the VPS and find out weaknesses.

iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# Reject is a syn-flood attack

iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# XMAS packets, also a recon packet

iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

# localhost interface

iptables -A INPUT -i lo -j ACCEPT

# Rules for INPUT and OUTPUT Bound to current connections.

iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Rules to enabled SSH port both Inbound and outbound.

iptables -A INPUT -i eth+ -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth+ -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# Rules to enabled Web non-ssl(80) port both Inbound and outbound.

iptables -A INPUT -i eth+ -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth+ -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT

# Rules to enabled Web SSL(443) port both Inbound and outbound.

iptables -A INPUT -i eth+ -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth+ -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

# Rules to all other incoming and outgoing request.

iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP

# service iptables save
# service iptables restart
# chkconfig iptables on
# chkconfig iptables --list



