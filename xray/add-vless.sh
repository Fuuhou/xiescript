#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
source /var/lib/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Vless WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless WS none TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m      Add Vless Account      \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		echo -e "\E[44;1;39m      Add Vless Account      \E[0m"
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
			echo "		Username Already Exist!"
			echo ""
			read -n 1 -s -r -p "Press any key to back on menu"
			m-vless
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&host=${domain}&type=ws&sni=${domain}#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/vless&encryption=none&host=${domain}&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
systemctl restart xray
clear
echo -e "━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-vless.log
echo -e "━━━━⟨ XRAY/VLESS ⟩━━━━" | tee -a /etc/log-create-vless.log
echo -e "━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-vless.log
echo -e "Remarks : ${user}" | tee -a /etc/log-create-vless.log
echo -e "Domain : ${domain}" | tee -a /etc/log-create-vless.log
echo -e "Limit IP : 2" | tee -a /etc/log-create-vless.log
echo -e "Port TLS : $tls" | tee -a /etc/log-create-vless.log
echo -e "Port N-TLS : $none" | tee -a /etc/log-create-vless.log
echo -e "Port gRPC : $tls" | tee -a /etc/log-create-vless.log
echo -e "ID : ${uuid}" | tee -a /etc/log-create-vless.log
echo -e "Security : none" | tee -a /etc/log-create-vless.log
echo -e "Network : ws" | tee -a /etc/log-create-vless.log
echo -e "Path : /vless" | tee -a /etc/log-create-vless.log
echo -e "ServiceName : vless-grpc" | tee -a /etc/log-create-vless.log
echo -e "━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-vless.log
echo -e "LINK TLS : ${vlesslink1}" | tee -a /etc/log-create-vless.log
echo -e "━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-vless.log
echo -e "LINK N-TLS  : ${vlesslink2}" | tee -a /etc/log-create-vless.log
echo -e "━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-vless.log
echo -e "LINK gRPC   : ${vlesslink3}" | tee -a /etc/log-create-vless.log
echo -e "━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-vless.log
echo -e "EXPIRED ON  : $exp" | tee -a /etc/log-create-vless.log
echo -e "━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-vless.log
echo "" | tee -a /etc/log-create-vless.log
read -n 1 -s -r -p "Press any key to back on menu"

m-vless
