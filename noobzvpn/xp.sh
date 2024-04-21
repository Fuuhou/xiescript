#!/bin/bash
clear
# // Auto Expired For NoobzVPN
data=( `cat /etc/noobzvpns/.noob | grep '^###' | cut -d ' ' -f 2 | sort | uniq`); # // Active Account
now=`date +"%Y-%m-%d"` # // Date Today
for user in "${data[@]}" # // User = data
do
exp=$(grep -w "^### $user" "/etc/noobzvpns/.noob" | cut -d ' ' -f 3 | sort | uniq) # // Expired Account
d1=$(date -d "$exp" +%s) # // Active Account
d2=$(date -d "$now" +%s) # // Date Today
exp2=$(( (d1 - d2) / 86400 )) # Xp 2
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/noobzvpns/.noob
noobzvpns --remove-user "$user"
fi
done
