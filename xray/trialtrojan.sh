domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Trojan WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Trojan WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:${tls}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
trojanlink="trojan://${uuid}@${domain}:${tls}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@${domain}:${ntls}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws#${user}"
clear
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━━⟨ XRAY/TROJAN ⟩━━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Remarks : ${user}"
echo -e "Domain : ${domain}"
echo -e "Port N-TLS : ${ntls}"
echo -e "Port TLS : ${tls}"
echo -e "Port gRPC : ${tls}"
echo -e "password : ${uuid}"
echo -e "Path : /trojan-ws"
echo -e "ServiceName : trojan-grpc"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK TLS : ${trojanlink}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK N-TLS : ${trojanlink2}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK gRPC : ${trojanlink1}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "EXPIRED ON : $exp"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"

m-trojan
