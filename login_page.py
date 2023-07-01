import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning

# Desactivar las advertencias de verificación de certificados SSL
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

opciones = int(input("Seleccione una opción: \n1. Inicio de sesión \n2. Cerrar sesión \nNúmero de elección: "))
print(opciones)

if opciones == 1:  # para iniciar la sesión
    login_url = 'https://conex.rnp.hn/LoginUsuario.aspx'
    username = input("Usuario: ")
    password = input("Contraseña: ")

    payload = {
        'username': username,
        'password': password
    }

    response = requests.post(login_url, data=payload, verify=False)

    if response.status_code == 200:
        print("Inicio de sesión exitoso")
    else:
        print("Error en el inicio de sesión")

elif opciones == 2:  # para cerrar la sesión
    logout_url = 'https://conex.rnp.hn/CerrarSesion.aspx'

    response = requests.get(logout_url, verify=False)

    if response.status_code == 200:
        print("Sesión cerrada exitosamente")
    else:
        print("Error al cerrar la sesión")

else:
    print("Ninguna opción seleccionada")
