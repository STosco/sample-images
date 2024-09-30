#!/bin/bash

NUM_IMAGES=100
SIZE_X=640
SIZE_Y=640
OUTPUT_FOLDER="./${SIZE_X}-${SIZE_Y}-images"
PARALLEL_PROCESSES=10  # Número de procesos paralelos

# Crea el directorio de salida si no existe
mkdir -p "$OUTPUT_FOLDER"

# Genera una secuencia de números y usa xargs para ejecutar curl en paralelo
seq 0 $((NUM_IMAGES - 1)) | xargs -n 1 -P "$PARALLEL_PROCESSES" -I {} curl -L "https://picsum.photos/${SIZE_X}/${SIZE_Y}?random={}" -o "$OUTPUT_FOLDER/{}.jpg"

