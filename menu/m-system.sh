#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m          • SYSTEM MENU •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] CHANGE DOMAIN"
echo -e " [\e[36m•2\e[0m] AUTO-REBOOT"
echo -e " [\e[36m•3\e[0m] RESTART SERVICE"
echo -e " [\e[36m•4\e[0m] BACKUP"
echo -e " [\e[36m•5\e[0m] RESTORE"
echo -e " [\e[36m•6\e[0m] SPEEDTEST"
echo -e " [\e[36m•7\e[0m] DNS CHANGER"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; m-domain ; exit ;;
2) clear ; auto-reboot ; exit ;;
3) clear ; restart ; exit ;;
4) clear ; backup ; exit ;;
5) clear ; restore ; exit ;;
6) clear ; speedtest ; exit ;;
7) clear ; m-dns ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Invalid Number!" ; sleep 1 ; m-system ;;
esac
