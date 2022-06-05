!/bin/bash
#acrips para optimizar la  creacion de servidors apache
clear
echo 'SERVIDORES APACHE V1, BY TOAF86'
echo 
<<coment
for i in "1..New Folder"
do
    echo $i
done
coment

elect=true


newfolder(){   #creacion de carpeta
   
    clear
    echo "creando numero servidor apache local"
    echo
    echo "nombre de la carpeta de /var/www"
    read -p "Nombre Carpeta>>>>>>> " ncarpeta
    sudo mkdir /var/www/$ncarpeta
    echo "se creo la carpeta en /var/www"
    ls -la /var/www
    echo 
    read -p "crear index (true, false)>>>> " next

}

editionfileindex(){#edicion de archivos index
    read -p "index name>>>> " index
    sudo touch /var/www/$ncarpeta/
    ls /var/www/$ncarpeta
    echo "archivo index editado con exito $index"
    echo "cambios guardados"
    read -p "crear archivo .conf (true, false)>>> " next
}



#condicional zone

if [ $elect = 1 ]; then

    newfolder
elif [ $elect = 2 ]; then 



else 
 echo "finish program"
fi 