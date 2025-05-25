#!/bin/bash

# log-cleaner.sh – Nettoyage de traces dans les logs Apache (access.log + error.log)
# Utilisation : sudo ./log-cleaner.sh <motif ou IP à effacer>

if [ "$EUID" -ne 0 ]; then
  echo "❌ Ce script doit être exécuté en tant que root (sudo)"
  exit 1
fi

if [ "$#" -ne 1 ]; then
  echo "Usage : $0 <motif ou IP à supprimer des logs>"
  exit 1
fi

PATTERN=$1
ACCESS_LOG="/var/log/apache2/access.log"
ERROR_LOG="/var/log/apache2/error.log"

echo "[*] Suppression des lignes contenant '$PATTERN' dans :"
echo "    - $ACCESS_LOG"
echo "    - $ERROR_LOG"

# Backup avant modification
cp $ACCESS_LOG $ACCESS_LOG.bak
cp $ERROR_LOG $ERROR_LOG.bak

# Suppression des lignes contenant le motif
grep -v "$PATTERN" $ACCESS_LOG > /tmp/access.tmp && mv /tmp/access.tmp $ACCESS_LOG
grep -v "$PATTERN" $ERROR_LOG > /tmp/error.tmp && mv /tmp/error.tmp $ERROR_LOG

echo "[✓] Nettoyage terminé. Sauvegardes disponibles avec extension .bak"