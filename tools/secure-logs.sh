#!/bin/bash
# tools/secure-logs.sh



echo "🔐 Aplicando seguridad a logs clásicos..."

for file in "${LOGS[@]}"; do
    if [ -f "$file" ]; then
        chmod 600 "$file"
        chown root:root "$file"
        echo "✅ Seguridad aplicada a $file"
    else
        echo "⚠️ $file no existe en este sistema"
    fi
done

echo ""
echo "🔍 Comprobando uso de systemd-journald..."

# Detectar journald
if command -v journalctl &> /dev/null; then
    echo "✅ systemd-journald detectado"

    # Crear persistencia de logs
    if [ ! -d /var/log/journal ]; then
        echo "📁 Creando almacenamiento persistente de logs..."
        sudo mkdir -p /var/log/journal
        sudo chmod 2755 /var/log/journal
        sudo systemctl restart systemd-journald
        echo "✅ Logs persistentes activados"
    else
        echo "ℹ️ Logs persistentes ya activos"
    fi
else
    echo "❌ journalctl no disponible"
fi
