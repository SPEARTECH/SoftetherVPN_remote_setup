# SoftetherVPN_remote_setup
Softether VPN remote server + client setup scripts and directions.
### -- Server Commands --
- sudo chmod 755 create_server.sh
- ./create_server.sh
- 1
- GroupCreate <groupname>
- HubCreate <hubname>
- UserCreate <username>
- UserPasswordSet <password>
- SecureNatEnable

### -- Client Commands --
- Wget https://www.softether-download.com/files/softether/v4.43-9799-beta-2023.08.31-tree/Linux/SoftEther_VPN_Client/64bit_-_Intel_x64_or_AMD64/softether-vpnclient-v4.43-9799-beta-2023.08.31-linux-x64-64bit.tar.gz
- tar xzvf softether-vpnclient-v4.43-9799-beta-2023.08.31-linux-x64-64bit.tar.gz
- ./vpncmd.exe
- 2
- *press enter (localhost)
- AccountCreate MyVPN /SERVER:<serverip> /HUB:<hubname> /USERNAME:<username> /NICNAME:vpn_se
<serverip>:<serverport>
- AccountPasswordSet MyVPN /PASSWORD:<username> /TYPE:standard
- AccountConnect MyVPN
- # change network adapter metric to 500 (so internet doesn’t go through it by default).
