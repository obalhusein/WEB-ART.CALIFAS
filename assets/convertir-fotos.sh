#!/bin/bash
# Uso: ./convertir-fotos.sh fotos-originales/
# Genera 3 tamaños WebP por cada foto JPG/PNG encontrada

INPUT_DIR="${1:-.}"
OUTPUT_DIR="images"
mkdir -p "$OUTPUT_DIR"

for f in "$INPUT_DIR"/*.{jpg,jpeg,JPG,png,PNG}; do
  [ -f "$f" ] || continue
  name=$(basename "${f%.*}")

  echo "Procesando: $name"

  # Escritorio (1200px ancho máximo)
  cwebp -resize 1200 0 "$f" -o "$OUTPUT_DIR/${name}.webp" -q 85

  # Tablet (800px)
  cwebp -resize 800 0 "$f" -o "$OUTPUT_DIR/${name}-tablet.webp" -q 83

  # Móvil (480px)
  cwebp -resize 480 0 "$f" -o "$OUTPUT_DIR/${name}-mobile.webp" -q 80

  echo "  ✓ ${name}.webp (escritorio, tablet, móvil)"
done

echo ""
echo "Conversión completada. Archivos en: $OUTPUT_DIR/"
