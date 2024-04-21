#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
addn() {
domain=$(cat /etc/xray/domain)
clear
echo -e "
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Add Account NoobzVPN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p "Username  : " user
read -p "Password  : " pass
read -p "Expired   : " masaaktif
clear
noobzvpns --add-user "$user" "$pass" --expired-user "$user" "$masaaktif"
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo "### ${user} ${expi}" >>/etc/noobzvpns/.noob
clear
echo -e "━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-noobzvpns.log
echo -e "━━━━━⟨ NOOBZVPN ⟩━━━━━" | tee -a /etc/log-create-noobzvpns.log
echo -e "━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-noobzvpns.log
echo -e "Username : $user" | tee -a /etc/log-create-noobzvpns.log
echo -e "Password : $pass" | tee -a /etc/log-create-noobzvpns.log
echo -e "Hostname : $domain" | tee -a /etc/log-create-noobzvpns.log
echo -e "Limit IP : 2" | tee -a /etc/log-create-noobzvpns.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-noobzvpns.log
echo -e "TCP_STD/HTTP  : 8080" | tee -a /etc/log-create-noobzvpns.log
echo -e "TCP_SSL/HTTPS : 8443" | tee -a /etc/log-create-noobzvpns.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-noobzvpns.log
echo -e "EXPIRED ON : $expi" | tee -a /etc/log-create-noobzvpns.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-noobzvpns.log
}

deln() {
deletn=$(grep -e "^### " "/etc/noobzvpns/.noob" | cut -d ' ' -f 2-3 | column -t | sort | uniq)
clear
echo "
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	Delete Account
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
$deletn
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"
read -p "Input Name: " name
if [ -z $name ]; then
menu
else
exp=$(grep -we "^### $user" "/noobzvpns/.noob" | cut -d ' ' -f 3 | sort | uniq)
sed -i "/^### $user $exp/,/^},{/d" /etc/noobzvpns/.noob
noobzvpns --remove-user "$name"
clear
echo "
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Noobz Deleted Account
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
User	: $name
Expired : $exp
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"
fi
}

listn() {
daftar=$(grep -e "^### " "/etc/noobzvpns/.noob" | cut -d ' ' -f 2-3 | column -t | sort | uniq)
expir=$(grep -we "^### $user" "/noobzvpns/.noob" | cut -d ' ' -f 3 | sort | uniq)
clear
echo "
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   List Noobz Account
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
$daftar  |  $expir
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"
}

m-noobz()
clear
echo "
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  [ NOOBZVPN MENU ]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
<<━━>>
1. Add Account
2. Delete Account
3. List Active Account
0. Back to Menu
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Input Number or X to exit
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"
read -p "Input Option: " opt
case $opt in
1|01) clear ; addn ;;
2|02) clear ; deln ;;
3|03) clear ; listn ;;
0|00) clear ; menu ; exit ;;
x|X) exit ;;
*) echo "Invalid Number!" ; sleep 1  ; m-noobz ;;
esac
