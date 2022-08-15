#!/bin/sh
## SCRIPT de IPTABLES - Compartir Internet con ETH1
##
## -Ncw -
#Comaparte internet de eth0 a eth1
#192.30.20.0/24 corresponde a la subred donde se va a compartir el internet
#

echo -n " Aplicando Reglas de Firewall..."
## FLUSH de reglas
iptables -F
iptables -X
iptables -Z
iptables -t nat -F
## Establecemos politica por defecto
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
# El localhost se deja (por ejemplo conexiones locales a mysql)
/sbin/iptables -A INPUT -i lo -j ACCEPT
# Al firewall tenemos acceso desde la red local
iptables -A INPUT -s 192.30.20.0/24 -i wlan0 -j ACCEPT
# Al firewall tenemos acceso desde la red local
iptables -A INPUT -s 192.30.20.0/24 -i wlan1 -j ACCEPT
#comenzamos a realizar el Puente desde eth0
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
#Direccionamos el Puente a eth0
iptables -A INPUT -s 192.30.20.0/24 -i wlan1 -j ACCEPT

#Se ejecuta la Orden
echo 1 > /proc/sys/net/ipv4/ip_forward
echo " OK . Verifique que lo que se aplica con: iptables -L -n"
# Fin del script