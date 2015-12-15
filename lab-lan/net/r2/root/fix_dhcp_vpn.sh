apt-get update
apt-get install dhcp3-server

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun
service openvpn restart
