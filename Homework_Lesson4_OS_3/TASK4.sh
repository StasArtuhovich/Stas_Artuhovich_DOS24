#!/bin/bash

# Проверка на количество переданных параметров
if [ "$#" -ne 4 ]; then
  echo "Usage: $0 <string> <start_index> <end_index> <action>"
  echo "<action> can be either 'extract' or 'remove'."
  exit 1
fi

# Получаем параметры
input_string="$1"
start_index=$2
end_index=$3
action=$4

let start_index=start_index-1
let length=end_index-start_index

# Проверяем действие
if [ "$action" == "extract" ]; then
  # Извлекаем подстроку
  extracted_substring=$(echo "$input_string" | cut -c$((start_index+1))-$((end_index)))
  echo "Extracted substring: $extracted_substring"
elif [ "$action" == "remove" ]; then
  # Удаляем подстроку
  modified_string=$(echo "$input_string" | sed "s/$(echo "${input_string:$start_index:$length}" | sed 's/[&/\]/\\&/g')//")
  echo "Modified string after removal: $modified_string"
else
  echo "Invalid action. Use 'extract' or 'remove'."
  exit 1
fi
