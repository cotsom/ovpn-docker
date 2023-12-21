#! /bin/bash

ip=$(hostname -I | cut -d " " -f 1)
user=$(whoami)
user1=$(whoami)1

docker-compose run --rm openvpn ovpn_genconfig -u udp://${ip}
docker-compose run --rm openvpn ovpn_initpki
docker-compose up -d openvpn

#Create 2 users
docker-compose run --rm openvpn easyrsa build-client-full ${user} nopass
docker-compose run --rm openvpn easyrsa build-client-full ${user1} nopass

#get user vpn config
docker-compose run --rm openvpn ovpn_getclient ${user} > ${user}.ovpn
docker-compose run --rm openvpn ovpn_getclient ${user1} > ${user1}.ovpn