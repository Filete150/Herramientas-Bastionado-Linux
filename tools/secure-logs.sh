#!/bin/bash
# tools/secure-logs.sh

LOGS=("/var/log/auth.log" "/var/log/syslog" "/var/log/kern.log")

for file in "${LOGS[@]}"; do
    if [ -f "$file" ]; then
        chmod 600 $file
        chown root:root $file
        echo "Seguridad aplicada a $file"
    fi
done
