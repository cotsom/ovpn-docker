#! /bin/sh

mv openvpn-autostart.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable openvpn-autostart.service