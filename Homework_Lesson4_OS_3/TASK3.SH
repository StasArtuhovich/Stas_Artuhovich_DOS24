#!/bin/bash

# Проверяем, что переданы два аргумента
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <filename> <new_extension>"
  exit 1
fi

filename=$1
new_ext=$2

# Проверяем, есть ли расширение в исходном файле
if [[ "$filename" == *.* ]]; then
  # Если расширение есть, меняем его
  base_name="${filename%.*}"
else
  # Если расширения нет, используем имя файла как есть
  base_name="$filename"
fi

# Создаем новое имя файла
new_filename="${base_name}.${new_ext}"

echo "Renamed file: $new_filename"

# Для демонстрации переименования (если требуется):
mv "$filename" "$new_filename"
