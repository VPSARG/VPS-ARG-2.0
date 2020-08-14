#!/bin/bash 

NOM=`less /etc/newadm/ger-user/nombre.log`
NOM1=`echo $NOM`
notify -i "📲 LA VPS: $NOM1 FUE REINICIADA 📲" -t "❗️El Reinicio fue ✔️EXITOSO✔️❗️"


