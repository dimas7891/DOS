!/data/data/com.termux/files/usr/bin/bash

###################################################
# CTRL C
###################################################
trap ctrl_c INT
ctrl_c() {
clear
echo -e $blue"[#]> (Ctrl + C ) Detected, Trying To Exit ...$nc "
sleep 1
echo ""
echo -e $red"[#]> Terima kasih sudah make tools saya ...$nc "
sleep 1
echo ""
echo -e $white"[#]> Solo Player No TEAM !!! ...$nc "
sleep 0.5
exit
}
#colors
blue='\e[1;34m'
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
grey="\033[0;37m"
purple="\033[0;35m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
lightcyan='\e[96m'
white='\e[1;37m'
nc="\e[0m"
red='\e[1;31m'
yellow='\e[1;33m'
#IP
DEFAULT_ROUTE=$(ip route show default | awk '/default/ {print $3}')
MYIP=$(ip route show | awk '(NR == 2) {print $9}')

# check internet
function checkinternet {
  echo ""
  ping -c 1 google.com > /dev/null
  if [[ "$?" != 0 ]]
  then
    echo -e $lightgreen" -----------------------------------$nc"
    echo -e $green" Checking For Internet: $red NOT CONNECT$nc"
    echo -e $lightgreen" -----------------------------------$nc"
    echo && sleep 0.5
     
  else
    echo -e $lightgreen" -----------------------------------$nc"
    echo -e $green" Checking For Internet: $red CONNECTED$nc"
    echo -e $lightgreen" -----------------------------------$nc"
    echo && sleep 0.5
  fi
}
checkinternet
clear
sleep 1
echo ""
echo -e "           Gateway:\033[32m$DEFAULT_ROUTE |$white My-Ip:$red$MYIP"
echo -e "$blue"
echo "         \\\************************************\\\ "
echo "            __  __          _          ____   "
echo "            \ \/ /___ _   _| |__   ___|  _ \  "
echo "             \  // __| | | | '_ \ / _ \ |_) | "
echo "             /  \ (__| |_| | |_) |  __/  _ <  " 
echo "            /_/\_\___|\__, |_.__/ \___|_| \_\ "
echo "                      |___/                   "
echo "         \\\************************************\\\ "
echo -e "$lightgreen"
echo "        Cara Penggunaan Nya : "
echo "     ~ Masukan Target Dengan *http://* contoh : http://example.com "
echo -e "$nc"
cd lib
chmod +x dos.py
echo -e "$red"
python dos.py
echo -e "$nc"
