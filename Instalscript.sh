#!/bin/bash
#sudo apt-get update  &>/dev/null
#sudo apt-get wget -y &>/dev/null
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Argentina_City /etc/localtime &>/dev/null
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
  "-bar2"|"-bar")cor="$AMARELO}==============================================================" && echo -e "${SEMCOR}${cor}${SEMCOR}";;
 esac
}
clear
 msg -bar2
echo ""

 msg -ama "     [ VPS-ARGENTO \033[1;36m 🔹by @Pablo_Ezekiel🔹\033[1;36m ]"

echo ""
 echo -e  "\033[1;31m        ============= ACTUALIZADORES  =============\033[1;31m "
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
echo ""
	echo -e  "\033[1;33m                   Paquetes Esenciales"
	echo "============================================================"
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

echo ""
	echo -e  "\033[1;36m                   Instalador Interno "
	
	echo "--------------------------------------------------------------"	
echo ""
	sleep 2
else
	echo ""
fi

ubu16_fun () {
    wget -O /etc/apt/sources.list https://raw.githubusercontent.com/VPSARG/VPS-ARG-2.0/master/Repositorios/16.04/sources.list &> /dev/null
	echo -e "\033[1;33m SELECCIONO “ UBUNTU 16"
}

ubu18_fun () {
    wget -O /etc/apt/sources.list https://raw.githubusercontent.com/VPSARG/VPS-ARG-2.0/master/Repositorios/18.04/sources.list &> /dev/null
	echo -e "\033[1;33m SELECCIONO “ UBUNTU 18"
}	

otro_fun () {
    
	echo "OK SELECCIONO “ OTRO"
}
	echo -e "\033[1;31m           --¿QUE UBUNTU ESTA UTILIZANDO?--"
	
echo ""
    echo -e "\033[1;32m Escoja la opcion deseada digitando el numero segun corresponda."

    msg -bar

    echo " 1).- Ubuntu 16.04 "

    echo " 2).- Ubuntu 18.04 "

    echo " 3).- Otro "

	msg -bar

	echo -n "Digite el numero segun respuesta: "
    read opcao
    case $opcao in
    1)
    ubu16_fun 
    ;;
    2)
    ubu18_fun
    ;;
    3)
    otro_fun
    ;;
    esac
	
sleep 3
## Restore working directory
cd $WORKING_DIR_ORIGINAL
vpsargup
