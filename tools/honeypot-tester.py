import socket
import time

PORTS = [22, 80, 443, 3306]
LOG_FILE = "/var/log/honeypot.log"

print("Honeypot iniciado...")
while True:
    for port in PORTS:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(0.5)
        result = s.connect_ex(('0.0.0.0', port))
        if result == 0:
            with open(LOG_FILE, "a") as f:
                f.write(f"Puerto {port} abierto: {time.ctime()}\n")
        s.close()
    time.sleep(5)
