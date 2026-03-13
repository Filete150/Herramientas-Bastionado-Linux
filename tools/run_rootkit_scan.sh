#!/bin/bash

# run_rootkit_scan.sh
# Script educativo para detectar posibles rootkits en Linux

LOG_FILE="/var/log/rootkit_scan.log"
echo "===============================" | tee -a $LOG_FILE
echo "Escaneo de rootkits iniciado: $(date)" | tee -a $LOG_FILE

# 1️⃣ Archivos y procesos sospechosos
echo -e "\n[+] Procesos sospechosos:" | tee -a $LOG_FILE
ps aux --sort=start_time | tail -n 20 | tee -a $LOG_FILE

# 2️⃣ Binarios ocultos o modificados
echo -e "\n[+] Archivos binarios modificados:" | tee -a $LOG_FILE
for cmd in ls ps netstat lsof; do
    which $cmd | xargs ls -l | tee -a $LOG_FILE
done

# 3️⃣ Archivos ocultos en directorios críticos
echo -e "\n[+] Archivos ocultos en /tmp y /var/tmp:" | tee -a $LOG_FILE
find /tmp /var/tmp -type f -name ".*" 2>/dev/null | tee -a $LOG_FILE

# 4️⃣ Verificar módulos del kernel sospechosos
echo -e "\n[+] Módulos del kernel cargados:" | tee -a $LOG_FILE
lsmod | tee -a $LOG_FILE

# 5️⃣ Comprobar crontabs sospechosos
echo -e "\n[+] Tareas programadas en crontab:" | tee -a $LOG_FILE
for user in $(cut -f1 -d: /etc/passwd); do
    echo "Crontab de $user:" | tee -a $LOG_FILE
    crontab -l -u $user 2>/dev/null | tee -a $LOG_FILE
done

echo -e "\nEscaneo completado: $(date)" | tee -a $LOG_FILE
echo "===============================" | tee -a $LOG_FILE
