import requests

opsiones = int(input("seleccion una Opsion \n1.Inicio de secion \n2.Cerrar secion.\nNumero de eleccion: "))
print (opsiones)

if opsiones == 1:  #para inciar la secion 
    login_url = 'https://conex.rnp.hn'
    username = input("Usuario: ")
    password = input("Contraseña: ")

    payload = {
        'username': username,
        'password': password
    }

    response = requests.post(login_url, data=payload)

    if response.status_code == 200:
        print("Inicio de sesión exitoso")
    else:
        print("Error en el inicio de sesión")

elif opsiones == 2: #para cerrar la secion 
    logout_url = 'https://conex.rnp.hn'

    response = requests.get(logout_url)

    if response.status_code == 200:
        print("Sesión cerrada exitosamente")
    else:
        print("Error al cerrar la sesión")


else:
    print("ninguna opsion seleccionada")