#!/bin/bash

# Проверка на наличие двух аргументов
if [ "$#" -ne 2 ]; then
    echo "Использование: $0 <строка, которую ищем> <путь к каталогу>"
    exit 1
fi

search_string=$1
directory=$2

# Проверка существования каталога
if [ ! -d "$directory" ]; then
    echo "Каталог $directory не существует."
    exit 1
fi

# Поиск строки во всех файлах каталога и подкаталогов
find "$directory" -type f 2>/dev/null | while read -r FILE; do
    if grep -q "$search_string" "$FILE" 2>/dev/null; then
        FILE_SIZE=$(stat --printf="%s" "$FILE" 2>/dev/null)
        echo "Файл: $FILE, Размер: $FILE_SIZE байт"
    fi
done

# Обработка ошибок доступа
if [ $? -ne 0 ]; then
    echo "Не удалось получить доступ к некоторым каталогам или файлам."
fi
