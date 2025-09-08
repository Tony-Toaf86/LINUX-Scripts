import cv2
import numpy as np
import os
from collections import deque

#Script para buscar vehiculos utilizando Yolo
#requesitos ( yolov3.cfg, yolov3.weights(peso 230 aproximad ), coco.names, )

#rutas de trabajo 
BASE_PATH = "/home/kali/Desktop/VIDEO"
CFG_PATH = os.path.join(BASE_PATH, "yolov3.cfg")
WEIGHTS_PATH = os.path.join(BASE_PATH, "yolov3.weights")
NAMES_PATH = os.path.join(BASE_PATH, "coco.names")
VIDEO_PATH = os.path.join(BASE_PATH, "video.mp4")
OUTPUT_FOLDER = os.path.join(BASE_PATH, "capturas_completas")

os.makedirs(OUTPUT_FOLDER, exist_ok=True)

# --- Cargar YOLO ---
net = cv2.dnn.readNetFromDarknet(CFG_PATH, WEIGHTS_PATH)
net.setPreferableBackend(cv2.dnn.DNN_BACKEND_OPENCV)
net.setPreferableTarget(cv2.dnn.DNN_TARGET_CPU)

# --- Cargar clases ---
with open(NAMES_PATH, "r") as f:
    CLASSES = [line.strip() for line in f.readlines()]

VEHICLE_CLASSES = {"car", "truck", "bus", "motorbike", "bicycle"}
vehicle_id_counter = 0

# --- Seguimiento simple con deque ---
vehicle_history = deque(maxlen=200)  # Almacena (center_x, center_y)

# --- Video ---
cap = cv2.VideoCapture(VIDEO_PATH)
layer_names = net.getLayerNames()
output_layers = [layer_names[i - 1] for i in net.getUnconnectedOutLayers()]

FRAME_SKIP = 5     # Saltar frames para acelerar
SCALE_FACTOR = 0.3      # Reducir tamaño del frame antes de procesar
CONF_THRESHOLD = 0.6    # Confianza mínima para detección
DIST_THRESHOLD = 40   # Distancia mínima para considerar vehículo "nuevo"
#DIST_THRESHOLD = int(0.02 * small_frame.shape[1]) 

frame_count = 0

while True:
    ret, frame = cap.read()
    if not ret:
        break

    frame_count += 1
    if frame_count % FRAME_SKIP != 0:
        continue

    # --- Reducir tamaño para velocidad ---
    small_frame = cv2.resize(frame, (0, 0), fx=SCALE_FACTOR, fy=SCALE_FACTOR)
    blob = cv2.dnn.blobFromImage(small_frame, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
    net.setInput(blob)
    outs = net.forward(output_layers)

    # --- Procesar detecciones ---
    for out in outs:
        for detection in out:
            scores = detection[5:]
            class_id = np.argmax(scores)
            confidence = scores[class_id]

            if CLASSES[class_id] in VEHICLE_CLASSES and confidence > CONF_THRESHOLD:
                # Escalar coordenadas al tamaño original
                center_x = int(detection[0] * small_frame.shape[1] / SCALE_FACTOR)
                center_y = int(detection[1] * small_frame.shape[0] / SCALE_FACTOR)

                # --- Verificar si es un vehículo nuevo ---
                if not any(abs(hx - center_x) < DIST_THRESHOLD and abs(hy - center_y) < DIST_THRESHOLD for hx, hy in vehicle_history):
                    vehicle_history.append((center_x, center_y))
                    vehicle_id_counter += 1

                    # Guardar imagen
                    filename = os.path.join(
                        OUTPUT_FOLDER,
                        f"vehiculo_{vehicle_id_counter}_{CLASSES[class_id]}_frame_{frame_count}.jpg"
                    )
                    cv2.imwrite(filename, frame, [cv2.IMWRITE_JPEG_QUALITY, 50])
                    print(f"[+] Foto guardada: {filename}")

cap.release()
print("Procesamiento de video completado.")
