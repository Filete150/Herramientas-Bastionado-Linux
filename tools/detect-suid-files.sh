#!/bin/bash

echo "Buscando archivos SUID en el sistema..."

find / -perm -4000 -type f 2>/dev/null

echo "Escaneo completado."
