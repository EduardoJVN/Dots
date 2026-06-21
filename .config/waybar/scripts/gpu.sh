#!/usr/bin/env bash

# Extraemos info en una sola pasada de nvidia-smi
UTIL=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
VRAM_USED=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits)
VRAM_TOTAL=$(nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits)

# Operación matemática interna de Bash (Aproximación limpia sin bc)
VRAM_USED_GB=$((VRAM_USED / 1024))
VRAM_TOTAL_GB=$((VRAM_TOTAL / 1024))

# Generamos la salida JSON para Waybar
echo "{\"text\": \"󰢮  ${UTIL}%\", \"tooltip\": \"NVIDIA RTX 5070 Ti\nTemp: ${TEMP}°C\nVRAM: ${VRAM_USED_GB}G / ${VRAM_TOTAL_GB}G\"}"