import os
import cv2
from ultralytics import YOLO
import shutil

# Ruta de la carpeta de imágenes
input_folder = "CPortillo"
output_folder = "solo_vehiculos_El_Portillo"
discard_folder = "descartadas"

# Crear carpetas de salida si no existen    
os.makedirs(output_folder, exist_ok=True)
os.makedirs(discard_folder, exist_ok=True)

# Cargar modelo YOLO preentrenado (detecta 80 clases de COCO)
model = YOLO("yolov8n.pt")  # también puedes usar yolov8s.pt o yolov8m.pt para más precisión

# Clases de vehículos en COCO
vehiculos = {"car", "bus", "truck", "motorbike", "bicycle"}

# Recorrer todas las imágenes
for file in os.listdir(input_folder):
    if file.lower().endswith((".jpg", ".jpeg", ".png")):
        image_path = os.path.join(input_folder, file)

        # Hacer detección
        results = model(image_path)

        # Revisar si alguna detección corresponde a un vehículo
        tiene_vehiculo = False
        for r in results:
            for c in r.boxes.cls:
                label = model.names[int(c)]
                if label in vehiculos:
                    tiene_vehiculo = True
                    break

        # Mover según el resultado
        if tiene_vehiculo:
            shutil.move(image_path, os.path.join(output_folder, file))
            print(f"✅ {file} → contiene vehículo, guardada en {output_folder}")
        else:
            shutil.move(image_path, os.path.join(discard_folder, file))
            print(f"❌ {file} → no tiene vehículo, movida a {discard_folder}")
