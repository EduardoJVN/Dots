#!/bin/bash
# Carpeta donde tenés todas tus fotos
DIR="/home/eduardo/wallpapers"

# Tiempo en segundos para cada cambio (600 segundos = 10 minutos)
INTERVAL=600

while true; do
    # Busca un archivo al azar dentro de la carpeta y lo aplica con animación
    BG=$(find "$DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | shuf -n 1)
    awww img "$BG" --transition-type center
    sleep $INTERVAL
done