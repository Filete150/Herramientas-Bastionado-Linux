#!/bin/bash

echo "Buscando archivos con permisos 777..."

find / -type f -perm 777 2>/dev/null

echo "Chequeo completado."

