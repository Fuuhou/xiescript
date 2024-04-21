#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)
echo "Checking VPS"
clear
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
RED='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
BCyan='\e[1;36m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="EXPIRED"
fi

#Service Status
sshh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$sshh" = "active" ]; then
resh="${GREEN}ON${NC}"
else
resh="${RED}OFF${NC}"
fi
nobz=$(systemctl status noobzvpns.service -l | grep active | cut -d ' ' $stat)
if [ "$nobz" = "active" ]; then
resnbz="${GREEN}ON${NC}"
else
resnbz="${RED}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${GREEN}ON${NC}"
else
resngx="${RED}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${GREEN}ON${NC}"
else
resv2r="${RED}OFF${NC}"
fi

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# user
Exp2=$"Life Time"
Name=$"❝𝐒𝐮𝐩𝐞𝐫𝐗𝐢𝐞𝐕𝐏𝐍❞"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
REGION=$( curl -s ipinfo.io/region )
WKT=$(curl -s ipinfo.io/timezone)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
LOC=$(curl -s ipinfo.io/country )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
clear
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "
${BPurple}██╗░░██╗██╗███████╗░██████╗████████╗░█████╗░██████╗░███████╗
╚██╗██╔╝██║██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
░╚███╔╝░██║█████╗░░╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
░██╔██╗░██║██╔══╝░░░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
██╔╝╚██╗██║███████╗██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
╚═╝░░╚═╝╚═╝╚══════╝╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝${NC}"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[39;1;92m           	         ⇱ SERVER INFORMATION ⇲                     \E[0m"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${BICyan} ⇲ 	${BICyan}╰(◣﹏◢)╯ 𝕏 𝕀 𝔼 𝕊 𝕋 𝕆 ℝ 𝔼 ╰(◣﹏◢)╯${NC}"
echo -e "${BICyan} ⇲ ${BICyan}IP              :  ${BIYellow}$IPVPS${NC}"
echo -e "${BICyan} ⇲ ${BICyan}CPU Info        :  ${BIYellow}$cname / $cores / $freq${NC}"
echo -e "${BICyan} ⇲ ${BICyan}CPU Usage       :  ${BIYellow}$cpu_usage${NC}"
echo -e "${BICyan} ⇲ ${BICyan}RAM             :  ${BIYellow}$uram / $tram${NC}"
echo -e "${BICyan} ⇲ ${BICyan}Uptime          :  ${BIYellow}$uptime${NC}"
echo -e "${BICyan} ⇲ ${BICyan}ISP             :  ${BIYellow}$ISP${NC}"
echo -e "${BICyan} ⇲ ${BICyan}Location        :  ${BIYellow}$WKT $REGION $CITY${NC}"
echo -e "${BICyan} ⇲ ${BICyan}Domain          :  ${BIYellow}$domain${NC}"
echo -e "${BICyan} ⇲ ${BICyan}Current Date    :  ${BIYellow}$DATE${NC}"
echo -e "${BICyan} ⇲ ${BICyan}certificate     :  ${BIYellow}$tlsStatus${NC}"
echo -e "${BICyan} ⇲ ${BICyan}Script By       :  ${BIYellow}$Name${NC}"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[39;1;92m           	         ⇱ SERVICE STATUS ⇲                        \E[0m"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "  ${BICyan}XRAY  ${NC}: $resv2r		${BICyan}SSH   ${NC}: $resh			${BICyan}Today   : ${BIYellow}$ttoday"
echo -e "  ${BICyan}NGINX ${NC}: $resngx        ${BICyan}NOOBZ ${NC}: $resnbz		${BICyan}Monthly : ${BIYellow}$tmon"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[39;1;92m         	         ⇱ MENU ⇲                          \E[0m"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " ${BICyan}[${BIWhite}01${BICyan}]${RED} •${NC} ${CYAN}SSH       				$NC ${BICyan}[${BIWhite}06${BICyan}]${RED} •${NC} ${CYAN}SETTING $NC"
echo -e " ${BICyan}[${BIWhite}02${BICyan}]${RED} •${NC} ${CYAN}VMESS     				$NC ${BICyan}[${BIWhite}07${BICyan}]${RED} •${NC} ${CYAN}STATUS SERVICE $NC"
echo -e " ${BICyan}[${BIWhite}03${BICyan}]${RED} •${NC} ${CYAN}VLESS    				$NC ${BICyan}[${BIWhite}08${BICyan}]${RED} •${NC} ${CYAN}CLEAR RAM $NC"
echo -e " ${BICyan}[${BIWhite}04${BICyan}]${RED} •${NC} ${CYAN}TROJAN   				$NC ${BICyan}[${BIWhite}09${BICyan}]${RED} •${NC} ${CYAN}REBOOT $NC"
echo -e " ${BICyan}[${BIWhite}05${BICyan}]${RED} •${NC} ${CYAN}NOOBZ    				$NC ${BICyan}[ ${BIWhite}X${BICyan}]${RED} •${NC} ${CYAN}EXIT $NC"
echo -e " ${RED}"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e   ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; m-sshovpn ;;
2) clear ; m-vmess ;;
3) clear ; m-vless ;;
4) clear ; m-trojan ;;
5) clear ; m-noobz ;;
6) clear ; m-system ;;
7) clear ; running ;;
8) clear ; clearcache ;;
9) clear ; reboot ; /sbin/reboot ;;
x) exit ;;
*) echo -e "";; echo " Invalid Number! " ; sleep 1 ; menu ;;
esac

