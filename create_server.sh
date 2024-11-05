#!/bin/bash
Wget https://www.softether-download.com/files/softether/v4.43-9799-beta-2023.08.31-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.43-9799-beta-2023.08.31-linux-x64-64bit.tar.gz
tar xzvf softether-vpnserver-v4.43-9799-beta-2023.08.31-linux-x64-64bit.tar.gz
cd vpnserver
sudo make
sudo ./vpnserver start
sudo ./vpncmd
# 1
# GroupCreate <group name>
# HubCreate <hub name>
# UserCreate <user name>
# UserPasswordSet <password>
# SecureNatEnable
