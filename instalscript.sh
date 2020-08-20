#!/bin/bash
#sudo apt-get update  &>/dev/null
#sudo apt-get wget -y &>/dev/null
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/México_City /etc/localtime &>/dev/null
rm $(pwd)/$0 &> /dev/null
### CONFIGURAR POR 22 SSH
#grep -v "^Port 22" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config &>/dev/null
#echo "Port 22" >> /etc/ssh/sshd_config
### COLORES Y BARRA 
msg () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${AMARELHO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${VERMELHO}" && echo -ne "${cor}${2}${SEMCOR}";;
  "-bar2"|"-bar")cor="$MAGENTA}===========================================================" && echo -e "${SEMCOR}${cor}${SEMCOR}";;
 esac
}
clear
 msg -bar2
echo ""

 msg -ama "         [ SCRIPT-ARGENTO \033[1;36m 🔹 VPS-ARG🔹\033[1;36m ]"

echo ""
 echo -e  "\033[1;31m       ============= ACTUALIZADORES  =============\033[1;31m "
## Script name
SCRIPT_NAME=vpsargup
## Install directory
WORKING_DIR_ORIGINAL="$(pwd)"
INSTALL_DIR_PARENT="/usr/local/vpsargup/"
INSTALL_DIR=${INSTALL_DIR_PARENT}${SCRIPT_NAME}/
## /etc/ config directory
mkdir -p "/etc/vpsargup/"
## Install/update
if [ ! -d "$INSTALL_DIR" ]; then
echo ""
       echo "=============================================================="
echo ""
	sleep 2
	mkdir -p "$INSTALL_DIR_PARENT"
	cd "$INSTALL_DIR_PARENT"
    wget https://raw.githubusercontent.com/VPSARG/VPS-ARG-2.0/master/Zzupdate-master/zzupdate-default.conf -O /usr/local/vpsargup/vpsargup.default.conf  &> /dev/null
	#chmod +x /usr/local/vpsargup/vpsargup.default.conf 
	rm -rf /usr/local/vpsargup/vpsargup.sh
    wget https://raw.githubusercontent.com/VPSARG/VPS-ARG-2.0/master/Zzupdate-master/zzupdate.sh -O /usr/local/vpsargup/vpsargup.sh &> /dev/null
	chmod +x /usr/local/vpsargup/vpsargup.sh
	rm -rf /usr/bin/vpsargup
    wget https://raw.githubusercontent.com/VPSARG/VPS-ARG-2.0/master/Zzupdate-master/zzupdate.sh -O /usr/bin/vpsargup &> /dev/null
	chmod +x /usr/bin/vpsargup

echo ""
	echo -e  "\033[1;36m              Configurando su Vps...  "
	
	sleep 2
else
	echo ""
fi

otro_fun () {
    
	echo "Haz Seleccionado Continuar Instalaciones"
}
	echo "=============================================================="
echo -e "\033[1;31m 🔹Recomendado utilizar Ubuntu 18 a 64 🔹 "
msg -bar2
echo ""
    echo -e "\033[1;32m Digite el 1 para continuar instalación."

    msg -bar

    echo " 1).- CONTINUAR INSTALACIONES COMPLEMENTARIAS "

	msg -bar

    read opcao
    case $opcao in
    1)
    otro_fun
    ;;
    esac
	
sleep 3
## Restore working directory
cd $WORKING_DIR_ORIGINAL
vpsargup
