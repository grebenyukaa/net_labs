#!/bin/sh
apt-get update
apt-get -y install --reinstall dnsmasq
apt-get -y install exim4
apt-get -y install popa3d

echo "chown -R Debian-exim:Debian-exim /var/lib/exim4"
chown -R Debian-exim:Debian-exim /var/lib/exim4

echo "chown -R popa3d:popa3d /var/lib/popa3d"
chown -R popa3d:popa3d /var/lib/popa3d
