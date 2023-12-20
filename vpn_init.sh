#! /bin/bash

ip=$(hostname -I | cut -d " " -f 1)
user=$(whoami)

docker-compose run --rm openvpn ovpn_genconfig -u udp://${ip}
docker-compose run --rm openvpn ovpn_initpki
docker-compose up -d openvpn

#Create user
docker-compose run --rm openvpn easyrsa build-client-full ${user} nopass

#get user vpn config
docker-compose run --rm openvpn ovpn_getclient ${user} > ${user}.ovpn