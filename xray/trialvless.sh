domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Vless WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
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
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━━⟨ XRAY/VLESS ⟩━━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Remarks : ${user}"
echo -e "Domain : ${domain}"
echo -e "Port N-TLS : $none"
echo -e "Port TLS : $tls"
echo -e "Port gRPC : $tls"
echo -e "ID : ${uuid}"
echo -e "Security : none"
echo -e "Network : ws"
echo -e "Path : /vless"
echo -e "ServiceName : vless-grpc"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK TLS : ${vlesslink1}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK N-TLS : ${vlesslink2}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK gRPC : ${vlesslink3}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "EXPIRED ON : $exp"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-vless
