import cv2
import os
#script para convertir videos imagenes
#by Toaf'Alonzo

def extraer_imagenes_cada_2s(video_path, output_folder):

    # Crear la carpeta de salida si no existe
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Abrir el video
    cap = cv2.VideoCapture(video_path)
    
    # Verificar si el video se abrió correctamente
    if not cap.isOpened():
        print(f"Error al abrir el video en la ruta: {video_path}")
        return

    # Obtener la tasa de fotogramas (FPS) del video
    fps = cap.get(cv2.CAP_PROP_FPS)
    print(f"FPS del video: {fps}")

    # Calcular el número de fotogramas a saltar para capturar cada 2 segundos
    frames_to_skip = int(fps * 1)
    print(f"Se capturará una imagen cada {frames_to_skip} fotogramas.")

    frame_count = 0
    image_count = 0

    while True:
        # Leer el siguiente fotograma
        ret, frame = cap.read()
        
        # Si no se puede leer el fotograma, el video ha terminado
        if not ret:
            break

        # Verificar si el fotograma actual es el que necesitamos
        if frame_count % frames_to_skip == 0:
            image_name = f"imagen_{image_count:04d}.jpg"
            image_path = os.path.join(output_folder, image_name)
            
            # Guardar el fotograma como un archivo de imagen
            cv2.imwrite(image_path, frame)
            print(f"Guardando {image_path}")
            
            image_count += 1
        
        frame_count += 1

    # Liberar el objeto de video
    cap.release()
    print(f"Proceso completado. Total de imágenes guardadas: {image_count}")

# Ejemplo de uso:
video_entrada = "video.mp4"  # Reemplaza con la ruta de tu video
carpeta_salida = "segundos"

extraer_imagenes_cada_2s(video_entrada, carpeta_salida)