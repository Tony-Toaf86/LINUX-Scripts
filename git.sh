#! /bin/bash


#-------scrip para minimizar uso de git en linux-----------
#version 1.0  by TONY-TOAF
#date -21-02-28
clear
echo "---------------- by TONY-TOAF----------------------------"
echo

#lista de opsiones primra instancia
for i in "1--add\n\n""2--init\n\n""3--status\n\n""4--commit\n\n""x--Salir"
do 
	echo $i
done
echo 
#variable de eleccion
read -p "aja una eleccion>>>>>> " eleccion
echo

#condicion add del programa
if  [ $eleccion = 1 ]; then 
	clear
	echo "add seleccionada"
	read -p "nombre de los archivos>>>>> " archivos
	read -p "cofirmar cambios (y-n)>>>>> " confirmar

	if [ $confirmar = y ]; then
		git add $archivos
		echo "archivos cofirmarmados" $archivos
		echo
		read -p "commit de los archivos>>> " commit
		git commit -m "$commit"
		echo
		echo "commit $commit confirmado con exito"
		git push
		echo "fin del programa"
		exit

	elif [ $confirmar != 1 ]; then
		clear
		echo "operacion abortada"
		exit
	
	fi


#condicional  sobre inicializacion 
elif [ $eleccion = 2 ]; then 
	clear
	git init 
	echo "git iniciado con exito"


#condicional sobre condicional status
elif [ $eleccion = 3 ]; then
	#statements
	clear
	git status
	exit


#condifcional commit 
elif [ $eleccion = 4 ]; then
		git add *
		read -p "commit de los archivos>>> " commit
		git commit -m "$commit"
		echo
		echo "commit $commit confirmado con exito"
		git push
		echo "fin del programa"
		exit


#condicional finish 

elif [ $eleccion = x ]; then 
	echo 'programa finalizado'

	exit


fi



<<comentario
permiso=su
clear
echo "-------scrip para minimizar uso de git en linux-----------"
echo
echo "---------------- by TONY-TOAF----------------------------"
echo
echo 
<<coment 
echo "-------introduca su contrasegna de administrador----------- "
echo 
sudo $permiso
clear
coment
echo "----------elija una opsion a continuacion------------"
echo

declare -a opsiones= (

	"s--------start git\n\n"
	"1--------- clonarn\n\n"
	"2--------- add\n\n"
	"3--------- commit\n\n"
	"4--------- log\n\n"
	"5--------- status\n\n"
	"6--------- restar\n\n"

	)

echo -e ${opsiones[@]}
read -p "eleccion--------------------  " eleccion
echo



if [ $eleccion = s ]; then ## para iniciar el git
	#statements
	echo "--------------iniciando git---------------------------"
	echo
	echo "-------introduca su contrasegna de administrador----------- "
	echo 
	sudo git init
	echo 
	echo "--------------git iniciado con exito-----------------"
	echo
	echo -e ${opsiones[@]:1:7}
	echo
	read -p "eleccion--------------------  " eleccion
	echo


elif [ $eleccion = 1 ]; then #clonar 
		clear
		read -p "paste the URL-------------------- " url 
		echo
		echo "--------------------clonando---------------"
		sudo git clone $url
		echo "------------------url clonado con exito ----------------"
		
	

elif [ $eleccion = 2 ]; then #add to git 
		clear
		echo "--------------add seleccionada-------------"
		echo
		read -p "nombre del archivo-------------------- " name 
		echo
		echo "--------------------agnadiendo---------------"
		sudo git add $name
		echo "------------------agnadido con exito ----------------"
		echo
		read -p "desea confimar los cambios( y-n)" change
		if [ $change = y ]; then 
			clear
			read -p "nota de los cambios---- " notec
			echo
			echo "confirmando los cambios "
			sudo git commit -m $notec
			echo "cambios confimados"
		else:
			clear
			echo -e "es recomendable que actualice los cambios\nejecute la opsion 3 para actualizar"
			echo
			exit

		fi


		

elif [ $eleccion = 3 ]; then #commit 
	clear
	echo "--------------commit seleccionada-------------"
	echo
	
	read -p "nota de los cambios---- " note
	echo 
	echo "--------------------actualizando---------------"
	sudo git commit  -m "$note"
	echo "------------------actualizado con exito ----------------"
	#agnadir status luego 

elif [ $eleccion = 4 ]; then #log
		clear
		echo "--------------log seleccionada-------------"
		echo
		echo  "--------------------listando arbol---------------"
		echo
		sudo git log --oneline
		echo
		echo "------------------arbol listado ----------------"
		## pendiente de agandir otra opsion de commit luego de add 
elif [ $eleccion = 5 ]; then #astatus
		clear
		echo "--------------status seleccionada-------------"
		echo
		echo "------------------mostrando el status del arbol ----------------"
		sudo git status
		echo
		
		## pendiente de agandir otra opsion de commit luego de add 

elif [ $eleccion = 6 ]; then #restar
		clear
		echo "--------------restar seleccionada-------------"
		echo
		read -p "nombre del archivo-------------------- " name 
		echo
		echo "--------------------agnadiendo---------------"
		sudo git restar $name
		echo "------------------restablecido con exito ----------------"
		## pendiente de agandir otra opsion de commit luego de add 		
fi



<<closed
echo 
echo "------git finalizado--------------------"
echo "------------saliendo-----------------"
closed

comentario