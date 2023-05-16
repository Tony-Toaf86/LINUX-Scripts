import os
print("concectanso a red wifi con la reminal")

lista = ["1___Verificar Antena", "2___exit", "3__Listar redes"] #lista de opsiones

for i in lista:
	print (i)

option = int(input("numero de la eleccion: ")) #eleccion 

if (option == 1):
	os.system("sudo -S ip link")
	option = int(input("numero de la eleccion: ")) #eleccion 

elif (option == 3):
	os.system("sudo -S iwlist scan wlan0")



