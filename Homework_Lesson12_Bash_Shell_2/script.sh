#!/bin/bash

LOGFILE="server.log"

# Проверка на существование файла
if [[ ! -f "$LOGFILE" ]]; then
  echo "Log file $LOGFILE not found!"
  exit 1
fi

# Извлечение успешных логинов (IP адреса со статусом 200)
echo "Successful logins (IP addresses):"
grep "status=200" "$LOGFILE" | awk -F 'ip=' '{print $2}' | awk '{print $1}' | sort | uniq
echo ""

# Извлечение уникальных пользователей со статусом 403
echo "Users with failed logins:"
grep "status=403" "$LOGFILE" | awk -F 'user=' '{print $2}' | awk '{print $1}' | sort | uniq
