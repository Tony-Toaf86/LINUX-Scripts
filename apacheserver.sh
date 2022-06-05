#!/bin/bash
#acrips para optimizar la  creacion de servidors apache
clear
echo 'SERVIDORES APACHE V1, BY TOAF86'
echo 
for i in "1..New Folder" "2..Newindex" "3..editionfileindex" "4..confcreateconf" "5..addfitoa2enside" "6..hostsedition" "7..updateapache" "*..all"
        
do
    echo $i
done
read -p "Eleccion>>>>> " elect



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
   # read -p "crear index (true, false)>>>> " next

}
newindex(){   #creacion de archivo index de var/www
    ls -la /var/www
    read -p "Ruta de la  Carpeta>>>>>>> " ncarpeta
    echo "nombre del archivo index"
    read -p "Nombre archivo index>>>>>>> " nindex
    sudo touch /var/www/$ncarpeta/$nindex
    echo "se creo el archivo index en /var/www/$ncarpeta/$nindex"
    ls -la /var/www/$ncarpeta
    echo 
   #  read -p "editar index file (true, false)>>>> " next
} 

confcreateconf(){ #creacion del achivo conf
    echo "nombre del archivo conf de /etc/apache2/sites-available"
    read -p "Nombre archivo>>>>>>> " fileconf
    sudo touch /etc/apache2/sites-available/$fileconf
    echo "se creo el archivo .confpeta en /etc/apache2/sites-available/"
    ls -la /etc/apache2/sites-available
    echo 
     #read -p "agnadir archivo ($fileconf) a servidor a2ensite (true, false)>>>> " next

}
addfitoa2enside(){ #funcin agnadir archivo con a2ensite
    echo "agnadiendo archivo con a2ensite"
    read -p "Nombre del archivo>>>>> " fileconf
    sudo a2ensite /etc/apache2/sites-available/$fileconf
    ls -la /etc/apache2/sites-available
    echo "se actualizo el documento $fileconf"
    echo 
   # read -p "actualizar host (true, false)>>>> " next
}
hostsedition(){ #funcion para editar el host
    clear
    echo "editar el host, agnadir el proxi"
    sudo gedit /etc/hosts
    echo 
    echo "hosts actualizado"
    echo 
    # read -p "actualiar apache2 (true, false)>>>> " next

}
updateapache(){ #actualizacion de apache
    echo "recargando el apache2"
    echo
    sudo systemctl apache2 reload
    echo "apache2 actualizado"
    exit
}
callfuncion(){ #llamando a todas las funciones
    newfolder
    newindex
    editionfileindex
    confcreateconf
    addfitoa2enside
    hostsedition
    updateapache

}

if [ $elect = 1 ]; then 
    newfolder
elif [ $elect = 2 ]; then 
    newindex
elif [ $elect = 3 ]; then 
    confcreateconf
elif [ $elect = 4 ]; then 
    addfitoa2enside
elif [ $elect = 5 ]; then 
    hostsedition
elif [ $elect = 6 ]; then 
    updateapache
elif [ $elect = * ]; then 
    callfuncion

fi






