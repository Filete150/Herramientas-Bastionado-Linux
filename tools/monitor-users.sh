#!/bin/bash

LOG_FILE="/var/log/user_monitor.log"
CURRENT="/tmp/current_users"
PREV="/tmp/prev_users"

# crear archivos si no existen
[ ! -f $CURRENT ] && touch $CURRENT
[ ! -f $PREV ] && touch $PREV

echo "Monitor de usuarios iniciado en $(date)" >> $LOG_FILE

while true; do
    who > $CURRENT

    if ! diff $CURRENT $PREV >/dev/null; then
        echo "Cambio de usuarios detectado: $(date)" >> $LOG_FILE
	who >> $LOG_FILE
	echo "---------------------" >> $LOG_FILE
        cp $CURRENT $PREV
    fi

    sleep 10
done
