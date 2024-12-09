#!/bin/bash

LOGFILE="server.log"

# Проверка на существование файла
if [[ ! -f "$LOGFILE" ]]; then
  echo "Log file $LOGFILE not found!"
  exit 1
fi

statuses=(200 403)

# Цикл по каждому статусу
for status in "${statuses[@]}"; do
  case "$status" in
    200)
      echo "IP addresses with status=200:"
      grep "status=200" "$LOGFILE" | awk -F 'ip=' '{print $2}' | awk '{print $1}' | sort | uniq
      echo ""
      ;;
    403)
      echo "Usernames with status=403:"
      grep "status=403" "$LOGFILE" | awk -F 'user=' '{print $2}' | awk '{print $1}' | sort | uniq
      echo ""
      ;;
    *)
      echo "Unknown status: $status"
      ;;
  esac
done
