#!/bin/bash

LOG="/var/log/auth.log"

echo "Buscando intentos fallidos de login SSH..."

grep "Failed password" $LOG

echo "Chequeo terminado."
