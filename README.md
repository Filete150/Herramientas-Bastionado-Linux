🛡️ Herramientas de Bastionado para Linux

Repositorio que contiene un conjunto de scripts simples de hardening (bastionado) para sistemas Linux.
Estas herramientas ayudan a detectar configuraciones inseguras, monitorizar actividad del sistema y mejorar la seguridad básica.

El objetivo de este proyecto es proporcionar herramientas educativas y prácticas para reforzar la seguridad de sistemas Linux mediante scripts sencillos en Bash y Python.

---

Estructura del repositorio:

Herramientas-Bastionado-Linux
│
├── tools
│   ├── monitor-users.sh
│   ├── firewall-helper.sh
│   ├── secure-logs.sh
│   ├── honeypot-tester.py
│   ├── check-root-users.sh
│   ├── detect-suid-files.sh
│   ├── scan-open-ports.sh
│   ├── ssh-failed-logins.sh
│   └── check-dangerous-permissions.sh
│
├── scripts
│   └── install.sh
│
├── docs
│
├── LICENSE
└── README.md

---

Herramientas incluidas:

1️⃣ Monitor de usuarios conectados
monitor-users.sh
- Detecta cambios en los usuarios conectados al sistema utilizando el comando 'who'.
- Registro en /var/log/user_monitor.log
- Uso: sudo ./tools/monitor-users.sh

2️⃣ Configuración básica de firewall
firewall-helper.sh
- Bloquea todas las conexiones entrantes, permite salientes y SSH.
- Uso: sudo ./tools/firewall-helper.sh

3️⃣ Protección de logs del sistema
secure-logs.sh
- Refuerza la seguridad de /var/log/auth.log, syslog y kern.log.
- Cambia propietario a root y permisos a 600.
- Uso: sudo ./tools/secure-logs.sh

4️⃣ Mini Honeypot de puertos
honeypot-tester.py
- Monitorea puertos comunes: 22, 80, 443, 3306.
- Registra eventos en /var/log/honeypot.log
- Uso: python3 tools/honeypot-tester.py

5️⃣ Detector de usuarios con privilegios root
check-root-users.sh
- Busca usuarios con UID 0
- Uso: ./tools/check-root-users.sh

6️⃣ Detector de archivos SUID
detect-suid-files.sh
- Busca archivos con el bit SUID activado
- Uso: sudo ./tools/detect-suid-files.sh

7️⃣ Escáner de puertos abiertos
scan-open-ports.sh
- Muestra los puertos abiertos en el sistema
- Uso: ./tools/scan-open-ports.sh

8️⃣ Detector de intentos fallidos de SSH
ssh-failed-logins.sh
- Analiza /var/log/auth.log para detectar intentos fallidos
- Uso: sudo ./tools/ssh-failed-logins.sh

9️⃣ Detector de permisos peligrosos
check-dangerous-permissions.sh
- Busca archivos con permisos 777
- Uso: sudo ./tools/check-dangerous-permissions.sh

---

Instalación rápida:

git clone https://github.com/TU-USUARIO/Herramientas-Bastionado-Linux.git
cd Herramientas-Bastionado-Linux
chmod +x tools/*.sh

Ejecuta las herramientas según sea necesario.

---

Objetivos del proyecto:

- Fines educativos
- Aprendizaje en seguridad Linux
- Práctica en bastionado de sistemas
- Auditoría de seguridad y monitorización

---

Aviso:

Estas herramientas están pensadas para uso educativo y en entornos de prueba.
No sustituyen soluciones profesionales de seguridad ni herramientas completas de hardening.

---

Licencia:

MIT (consultar archivo LICENSE)

---

Autor: Alejandro González Filippi

Proyecto desarrollado como práctica de bastionado de sistemas Linux.
