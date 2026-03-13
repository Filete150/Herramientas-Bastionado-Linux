#!/bin/bash
# scripts/install.sh

echo "Instalando herramientas de bastionado..."

cp ../tools/* /usr/local/bin/
chmod +x /usr/local/bin/*

pip3 install --user socket

echo "Instalación completa."
