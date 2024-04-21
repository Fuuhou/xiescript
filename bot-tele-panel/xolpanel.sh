#!/bin/bash

#install
rm -rf xolpanel.sh
apt update && apt upgrade
apt install python3 python3-pip git
git clone https://github.com/givpn/xolpanel.git
unzip xolpanel/xolpanel.zip
pip3 install -r xolpanel/requirements.txt
pip3 install pillow

#isi data
echo ""
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your ID Telegram : " admin
read -e -p "[*] Input Your Subdomain : " domain
echo -e BOT_TOKEN='"'$bottoken'"' >> /root/xolpanel/var.txt
echo -e ADMIN='"'$admin'"' >> /root/xolpanel/var.txt
echo -e DOMAIN='"'$domain'"' >> /root/xolpanel/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "User ID : $admin"
echo "Bot Token : $bottoken"
echo "Subdomain : $domain"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Setting Done Please Wait 10s"
sleep 10

cat > /etc/systemd/system/xolpanel.service << END
[Unit]
Description=Simple XolPanel - @superxiez
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m xolpanel
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start xolpanel 
systemctl enable xolpanel

clear

echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Installations completed, type /menu on your bot"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -n 1 -s -r -p "Press any key to back"
rm -rf xolpanel.sh
clear
menu
