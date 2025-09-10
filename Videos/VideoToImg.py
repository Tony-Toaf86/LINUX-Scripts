import cv2
import os

# script para convertir videos en imágenes desde un tiempo específico
# by Toaf'Alonzo

def extraer_imagenes_cada_2s(video_path, output_folder, start_time="00:00:00"):
 

    # Crear la carpeta de salida si no existe
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Abrir el video
    cap = cv2.VideoCapture(video_path)
    
    if not cap.isOpened():
        print(f"Error al abrir el video en la ruta: {video_path}")
        return

    # Obtener FPS
    fps = cap.get(cv2.CAP_PROP_FPS)
    print(f"FPS del video: {fps}")

    # Calcular cuántos frames saltar (1 frame cada X segundos)
    frames_to_skip = int(fps * 0.50)   # cada 1 segundos
    print(f"Se capturará una imagen cada {frames_to_skip} fotogramas.")

    # --- Convertir hora de inicio a milisegundos ---
    h, m, s = map(int, start_time.split(":"))
    start_ms = (h * 3600 + m * 60 + s) * 1000
    cap.set(cv2.CAP_PROP_POS_MSEC, start_ms)
    print(f"Iniciando desde {start_time} ({start_ms} ms)")

    frame_count = 0
    image_count = 0

    while True:
        ret, frame = cap.read()
        if not ret:
            break

        if frame_count % frames_to_skip == 0:
            image_name = f"imagen_{image_count:04d}.jpg"
            image_path = os.path.join(output_folder, image_name)
            cv2.imwrite(image_path, frame)
            print(f"Guardando {image_path}")
            image_count += 1

        frame_count += 1

    cap.release()
    print(f"Proceso completado. Total de imágenes guardadas: {image_count}")

# Ejemplo de uso
video_entrada = "video.mp4"
carpeta_salida = "Camar_Portillo"

# Aquí defines desde qué hora/minuto/segundo iniciar
extraer_imagenes_cada_2s(video_entrada, carpeta_salida, start_time="01:18:00")
