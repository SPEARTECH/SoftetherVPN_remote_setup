#!/bin/bash

HUBNAME=""
USERNAME=""
INTERFACE=""

cd /usr/local
sudo apt-get update

wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.34-9745-beta/softether-vpnserver_v4.34-9745-beta-2020.04.05-linux-x64-64bit.tar.gz
tar xzvf softether-vpnserver_v4.34-9745-beta-2020.04.05-linux-x64-64bit.tar.gz

cd vpnserver
make

sudo ./vpncmd localhost /SERVER /CMD HubCreate $HUBNAME
sudo ./vpncmd localhost /SERVER /CMD UserCreate $USERNAME
sudo ./vpncmd localhost /SERVER /CMD UserPasswordSet $USERNAME /PASSWORD:$PASSWORD
sudo ./vpncmd localhost /SERVER /CMD BridgeCreate $HUBNAME /DEVICE:$INTERFACE

# Enable SecureNAT in the VPNCMD prompt:
# This will allow VPN clients to be assigned virtual IP addresses and route traffic as if they are part of the same network.
sudo ./vpncmd localhost /SERVER /CMD SecureNatEnable
sudo ./vpnserver start
# cp /root/SCCT-LAN-Breakout/signalserver/scct.service /etc/systemd/system/

