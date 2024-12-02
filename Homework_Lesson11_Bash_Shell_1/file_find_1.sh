#!/bin/bash

# Проверка на наличие трех аргументов
if [ "$#" -ne 3 ]; then
    echo "Использование: $0 <output_file> <directory> <extension>"
    exit 1
fi

OUTPUT_FILE=$1
DIRECTORY=$2
EXTENSION=$3

# Проверка существования каталога
if [ ! -d "$DIRECTORY" ]; then
    echo "Каталог $DIRECTORY не существует."
    exit 1
fi

# Поиск файлов и запись в файл
find "$DIRECTORY" -type f -name "*.$EXTENSION" > "$OUTPUT_FILE"

echo "Список файлов с расширением .$EXTENSION из каталога $DIRECTORY записан в $OUTPUT_FILE."
