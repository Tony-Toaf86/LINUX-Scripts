import itertools

# Conjunto de caracteres
#caracteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
caracteres = '120'

# Longitud mínima y máxima de las contraseñas
long_min = 4
long_max = 6

# Nombre del archivo de salida
archivo_salida = "diccionario_fuerza_bruta.txt"
contador = 0

with open(archivo_salida, 'w') as archivo:
    for longitud in range(long_min, long_max + 1):
        for combinacion in itertools.product(caracteres, repeat=longitud):
            password = ''.join(combinacion)
            archivo.write(password + '\n')
                

print(f"Diccionario generado: {archivo_salida}")
