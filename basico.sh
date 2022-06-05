#!/bin/sh

#comandos basicos


read -p "folder created >>> " folder
read -p "file created?>>>> " file 


editionfileindex(){#edicion de archivos index
    mkdir /home/toaf/Escritorio/$folder
    touch /home/toaf/Escritorio/$file
    sudo nano /home/toaf/Escritorio/$folder/$file
    echo "archivo index editado con exito"
    echo "cambios guardados"
    # read -p "crear archivo .conf (true, false)>>> " next 
    
    }

editionfileindex




<<coment
if [ $condicional = true ]; then 
    echo "el condicional es true"

    condicional=true

    if [ $condicional != true ]; then

        echo "se cambio el condicional"
    else
        echo "no se cambio el condiconal"

    fi

else 

    echo "el condicional no es true"
fi




editionfileindex(){#edicion de archivos index
    sudo gedit /var/www/$nindex
    echo "archivo index editado con exito"
    echo "cambios guardados"
    read -p "crear archivo .conf (true, false)>>> " next

}

confcreateconf(){ #creacion del achivo conf
    echo "nombre del archivo conf de /etc/apache2/sites-available"
    read -p "Nombre archivo>>>>>>> " fileconf
    sudo touch /etc/apache2/sites-available/$fileconf
    echo "se creo el archivo .confpeta en /etc/apache2/sites-available/"
    ls -la /etc/apache2/sites-available
    echo 
    read -p "agnadir archivo ($fileconf) a servidor a2ensite (true, false)>>>> " next

}
addfitoa2enside(){ #funcin agnadir archivo con a2ensite
    echo "agnadiendo archivo con a2ensite"
    read -p "Nombre del archivo>>>>> " fileconf
    sudo a2ensite /etc/apache2/sites-available/$fileconf
    ls -la /etc/apache2/sites-available
    echo "se actualizo el documento $fileconf"
    echo 
    read -p "actualizar host (true, false)>>>> " next
}
hostsedition(){ #funcion para editar el host
    clear
    echo "editar el host, agnadir el proxi"
    sudo gedit /etc/hosts
    echo 
    echo "hosts actualizado"
    echo 
    read -p "actualiar apache2 (true, false)>>>> " next

}
updateapache(){ #actualizacion de apache
    echo "recargando el apache2"
    echo
    sudo systemctl apache2 reload
    echo "apache2 actualizado"
    exit
}
coment