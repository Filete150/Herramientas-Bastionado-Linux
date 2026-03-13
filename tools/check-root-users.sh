#!/bin/bash

echo "Buscando usuarios con UID 0..."

awk -F: '($3 == 0) {print "Usuario con privilegios root:", $1}' /etc/passwd

echo "Chequeo terminado."
