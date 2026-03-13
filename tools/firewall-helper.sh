#!/bin/bash
# tools/firewall-helper.sh

echo "Activando reglas de firewall básicas..."
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable

echo "Firewall activado con reglas básicas."
