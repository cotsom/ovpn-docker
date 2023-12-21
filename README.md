# This repository contains

1) Vpn deployment script
2) systemd unit for deploy a vpn launch service on the client device
<hr>

## vpn
To deploy vpn, you just need to run vpn_init.sh , come up with a passphrase(from 4 to 1023 characters) for your CA key(also confirm it later), and common name.

After launching, you will receive 2 config files in the same directory. 
You can also add a new vpn user and get his config with the following commands
```
docker-compose run --rm openvpn easyrsa build-client-full USERNAME nopass
docker-compose run --rm openvpn ovpn_getclient USERNAME > USERNAME.ovpn
```

## systemd

In the systemd-unit directory you will find a description of the service, which will initialize the VPN connection every time the device is started.

*In the openvpn-autostart.service file, change the `ExecStart=/usr/sbin/openvpn /path/to/your/vpnconfig` to the absolute path to your vpn config*

The script init-unit.sh will enable your service
