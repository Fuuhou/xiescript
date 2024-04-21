#!/bin/bash
# pewarna hidup
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
# Getting
# IP Validation
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
clear

# GETTING OS INFORMATION
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# VPS ISP INFORMATION
echo -e "$ITAM"
MYIP=$(curl -s ipinfo.io/ip )
REGION=$( curl -s ipinfo.io/region )
CITY=$( curl -s ipinfo.io/city )

# CHEK STATUS
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel_service=$(/etc/init.d/stunnel4 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wstls=$(systemctl status ws-stunnel.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsdrop=$(systemctl status ws-dropbear.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
noobz_service=$(systemctl status noobzvpns.service -l | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
squid_service=$(systemctl status squid | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(service nginx status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# COLOR VALIDATION
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear

# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh=" ${GREEN}Active [ ON ]${NC}"
else
   status_ssh=" ${RED}Error [ OFF ]${NC}"
fi

# STATUS SERVICE  SQUID 
if [[ $squid_service == "running" ]]; then 
   status_squid=" ${GREEN}Active [ ON ]${NC}"
else
   status_squid=" ${RED}Error [ OFF ]${NC}"
fi

# STATUS SERVICE  NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx=" ${GREEN}Active [ ON ]${NC}"
else
   status_nginx=" ${RED}Error [ OFF ]${NC}"
fi


# STATUS SERVICE  VNSTAT 
if [[ $vnstat_service == "running" ]]; then 
   status_vnstat=" ${GREEN}Active [ ON ]${NC}"
else
   status_vnstat=" ${RED}Error [ OFF ]${NC}"
fi

# STATUS SERVICE  CRONS 
if [[ $cron_service == "running" ]]; then 
   status_cron=" ${GREEN}Active [ ON ]${NC}"
else
   status_cron=" ${RED}Error [ OFF ]${NC}"
fi

# STATUS SERVICE  FAIL2BAN 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban=" ${GREEN}Active [ ON ]${NC}"
else
   status_fail2ban=" ${RED}Error [ OFF ]${NC}"
fi

# STATUS SERVICE  TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   status_tls_v2ray=" ${GREEN}Active [ ON ]${NC}"
else
   status_tls_v2ray=" ${RED}Error [ OFF ]${NC}"
fi

# STATUS SERVICE NON TLS V2RAY
if [[ $nontls_v2ray_status == "running" ]]; then 
   status_nontls_v2ray=" ${GREEN}Active [ ON ]${NC}"
else
   status_nontls_v2ray=" ${RED}Error [ OFF ]${NC}"
fi

# STATUS SERVICE VLESS HTTPS
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless=" ${GREEN}Active [ ON ]${NC}"
else
  status_tls_vless=" ${RED}Error [ OFF ]${NC}"
fi

# STATUS SERVICE VLESS HTTP
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless=" ${GREEN}Active [ ON ]${NC}"
else
  status_nontls_vless=" ${RED}Error [ OFF ]${NC}"
fi
# STATUS SERVICE TROJAN
if [[ $trojan_server == "running" ]]; then 
   status_virus_trojan=" ${GREEN}Active [ ON ]${NC}"
else
   status_virus_trojan=" ${RED}Error [ OFF ]${NC}"
fi
# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh=" ${GREEN}Active [ ON ]${NC}"
else
   status_beruangjatuh=" ${RED}Error [ OFF ]${NC}"
fi

# STATUS SERVICE STUNNEL
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel=" ${GREEN}Active [ ON ]${NC}"
else
   status_stunnel=" ${RED}Error [ OFF ]${NC}"
fi
# STATUS SERVICE WEBSOCKET TLS
if [[ $wstls == "running" ]]; then 
   swstls=" ${GREEN}Active [ ON ]${NC}"
else
   swstls=" ${RED}Error [ OFF ]${NC}"
fi

# STATUS SERVICE WEBSOCKET DROPBEAR
if [[ $wsdrop == "running" ]]; then 
   swsdrop=" ${GREEN}Active [ ON ]${NC}"
else
   swsdrop=" ${RED}Error [ OFF ]${NC}"
fi

# STATUS NOOBZVPN
if [[ $noobz_service == "running" ]]; then 
   noobz_status=" ${GREEN}Active [ ON ]${NC}"
else
   noobz_status=" ${RED}Error [ OFF ]${NC}"
fi


# SYSTEM INFORMATION
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))
WKT=$(curl -s ipinfo.io/timezone)
uram=$( free -m | awk 'NR==2 {print $3}' )

# KERNEL TERBARU
kernelku=$(uname -r)

# DNS PATCH
#tipeos2=$(uname -m)
Name=$"❝𝐒𝐮𝐩𝐞𝐫𝐗𝐢𝐞𝐕𝐏𝐍❞"
Exp=$"Life Time"
# GETTING DOMAIN NAME
Domen="$(cat /etc/xray/domain)"
echo -e ""
echo -e "\e[1;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\e[1;34m                ⇱ SYSTEM INFORMATION ⇲              \e[0m"
echo -e "\e[1;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\e[1;32m IP        \e[0m: $MYIP"
echo -e "\e[1;32m Domain    \e[0m: $Domen"
echo -e "\e[1;32m CPU       \e[0m: $cpu_usage1"
echo -e "\e[1;32m RAM       \e[0m: $uram"
echo -e "\e[1;32m Date      \e[0m: $biji"
echo -e "\e[1;32m Location  \e[0m: ${WKT}, ${REGION}, $CITY"
echo -e "\e[1;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\e[1;34m                ⇱ SERVICE STATUS ⇲               \e[0m"
echo -e "\e[1;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\e[1;32m SSH/TUN           \e[0m: $status_ssh"
echo -e "\e[1;32m Dropbear          \e[0m: $status_beruangjatuh"
echo -e "\e[1;32m Stunnel4          \e[0m: $status_stunnel"
echo -e "\e[1;32m Fail2Ban          \e[0m: $status_fail2ban"
echo -e "\e[1;32m Crons             \e[0m: $status_cron"
echo -e "\e[1;32m Nginx             \e[0m: $status_nginx"
echo -e "\e[1;32m Squid             \e[0m: $status_squid"
echo -e "\e[1;32m Vnstat            \e[0m: $status_vnstat"
echo -e "\e[1;32m XRAY Vmess TLS    \e[0m: $status_tls_v2ray"
echo -e "\e[1;32m XRAY Vmess N-TLS  \e[0m: $status_nontls_v2ray"
echo -e "\e[1;32m XRAY Vless TLS    \e[0m: $status_tls_vless"
echo -e "\e[1;32m XRAY Vless N-TLS  \e[0m: $status_nontls_vless"
echo -e "\e[1;32m XRAY Trojan       \e[0m: $status_virus_trojan"
echo -e "\e[1;32m NoobzVPN          \e[0m: $noobz_status"
echo -e "\e[1;32m Websocket TLS     \e[0m: $swstls"
echo -e "\e[1;32m Websocket N-TLS   \e[0m: $swstls"
echo -e "\e[1;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\e[1;34m 		  ╰(◣﹏◢)╯ 𝕏 𝕀 𝔼 𝕊 𝕋 𝕆 ℝ 𝔼 ╰(◣﹏◢)╯			\e[0m"
echo -e "\e[1;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu

