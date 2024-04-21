#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`

clear
IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Create Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

if [[ ! -z "${PID}" ]]; then
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━━⟨ TRIAL_SSH_WS ⟩━━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Username : $Login"
echo -e "Password : $Pass"
echo -e "Hostname : $domen"
echo -e "$domen:$portsshws@$Login:$Pass"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "OpenSSH : $opensh"
echo -e "Dropbear : $db"
echo -e "SSH WS : $portsshws"
echo -e "SSH SSL WS : $wsssl"
echo -e "SSL/TLS : $ssl"
echo -e "SSH UDP : 1-65535"
echo -e "UDPGW : 7100-7900"
echo -e "Port Squid : $sqd"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Payload WS :"
echo -e "GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "EXPIRED ON : $exp"
echo -e "━━━━━━━━━━━━━━━━━━━━"

else

echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━━⟨ TRIAL_SSH_WS ⟩━━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Username   : $Login"
echo -e "Password   : $Pass"
echo -e "Hostname   : $domen"
echo -e "$domen:$portsshws@$Login:$Pass"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "OpenSSH    : $opensh"
echo -e "Dropbear   : $db"
echo -e "SSH WS     : $portsshws"
echo -e "SSH SSL WS : $wsssl"
echo -e "SSL/TLS    : $ssl"
echo -e "SSH UDP    : 1-65535"
echo -e "UDPGW      : 7100-7900"
echo -e "Port Squid : $sqd"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Payload WS :"
echo -e "GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "EXPIRED ON : $exp"
echo -e "━━━━━━━━━━━━━━━━━━━━"
fi
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
