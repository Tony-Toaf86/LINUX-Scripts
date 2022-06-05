#!/bin/bash

#escrip para youtube-dl
#version 1.1 by tony-toaf
clear
echo "----------------------YOUTUBE-DL------------"
echo "----------------BY TONY-TOAF----------------"
echo
echo

echo "-------elija un function a realizar------"
echo
echo
echo "1. Descarga normal"
echo


read -p "Numero de la eleccion>>>>>>>>> " ELECCION

if [ $ELECCION = 1 ]; then
  #statements
  read -p "pegue el enlace del video>>>>> " ENLACE
  youtube-dl "$ENLACE"
  echo "Descarga finalizada"
  ls
fi
