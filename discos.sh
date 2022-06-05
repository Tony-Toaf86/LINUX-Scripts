#!/bin/bash 
<< coment 
---------scrip para manipular los discos duros byt Tony---------

coment

clear
echo 'Scrip para manipular discos by Tony-Toaf'
echo 


for i in "1..montar\n\n""2..desmontar"
do 
	echo $i
done
echo 
read -p 'eleccion>>>>>> ' eleccion 
echo 

#condicional montar
if [ $eleccion = 1 ]; then 
	clear
	echo "opsion montar seleccionada"
	echo
	lsblk
	echo 
	read -p 'nombre de la particion>>>>> ' nparticion
	read -p 'seleccionno $nparticion (y-n)>>>> ' confirmar

	if [ $confirmar = y ]; then 
		echo 'montado parcicion $nparticion'
		sudo mount /dev/$nparticion /disco-files
		cd /disco-files && ls -la
	fi

fi 