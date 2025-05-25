#!/usr/bin/env python3

# scanner.py – Scanner de ports simple en Python
# Utilisation : python3 scanner.py <IP cible> <port_min> <port_max>

import socket
import sys

if len(sys.argv) != 4:
    print("Usage: python3 scanner.py <IP cible> <port_min> <port_max>")
    sys.exit(1)

ip = sys.argv[1]
start_port = int(sys.argv[2])
end_port = int(sys.argv[3])

print(f"🔎 Scan des ports de {ip} de {start_port} à {end_port}...
")

for port in range(start_port, end_port + 1):
    try:
        sock = socket.socket()
        sock.settimeout(0.5)
        sock.connect((ip, port))
        print(f"✅ Port {port} [OUVERT]")
        sock.close()
    except:
        pass

print("
Scan terminé.")