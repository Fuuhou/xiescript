#!/bin/bash

BGreen='\e[1;32m'
NC='\e[0m'
cd
rm -rf slowdns.sh
rm -rf udp.sh
rm -rf vpn.sh
rm -rf openvpn.sh
rm -rf log-install.txt
rm -rf /usr/bin/usernew
rm -rf /usr/bin/trial
rm -rf /root/domain
echo "\e[1;32m Update Menu.. \e[0m"
sleep 1
rm -rf /root/udp
mkdir -p /root/udp
# install udp-custom
echo ""
sleep 1
echo "\e[1;32m Process Download Script UDP-Custom.. \e[0m"
sleep 1
clear
echo "\e[1;32m Checking Tool UDP-Custom.. \e[0m"
sleep 1
clear
echo "\e[1;32m Success Checking Tool.. \e[0m"
sleep 1
clear
echo "\e[1;32m Please Wait, Process Downloading Tool UDP-Custom.. \e[0m"
sleep 1
clear
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://github.com/Fuuhou/xiescript/raw/main/udp-custom/udp-custom-linux-amd64" -O /root/udp/udp-custom && rm -rf /tmp/cookies.txt
chmod +x /root/udp/udp-custom
clear
# install Config Default Udp
echo ""
sleep 1
echo "\e[1;32m Process Download Script Config Default.. \e[0m"
sleep 1
clear
echo "\e[1;32m Checking Config Default.. \e[0m"
sleep 1
clear
echo "\e[1;32m Success Checking Config Default Tool.. \e[0m"
sleep 1
clear
echo "\e[1;32m Please Wait, Process Downloading Default Config UDP-Custom.. \e[0m"
sleep 1
clear
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://github.com/Fuuhou/xiescript/raw/main/udp-custom/config.json" -O /root/udp/config.json && rm -rf /tmp/cookies.txt
chmod 644 /root/udp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP-Custom

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP-Custom

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server -exclude $1
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

echo start service udp-custom
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null

echo ""
sleep 0,5
clear
cd
rm -rf udp.sh
rm -rf slowdns.sh
echo -e "\e[1;32m Done Installed UDP-Custom \e[0m"
sleep 1


