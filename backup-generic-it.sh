#!/bin/bash
# ======================================
# MastroAlberto - file generato il 24/10/2025 
# contatto: alberto.bella@protonmail.com
# ======================================


# IMPORTANTE LEGGI PRIMA DI USARE LO SCRIPT
# modifica questi valori prima di usare lo script, il file di log va creato prima di avviarlo 
# altrimenti non verrà collezionato alcun log.
# notify-send dovrebbe funzionare su tutti i sistemi, se non funziona apri una issue su github.

SOURCE='<your_source>'
DEST='<path_to_your_rclone>'
LOGFILE='<log_file_location>'

DATE=$(date "+%Y-%m-%d %H:%M:%S")

/usr/bin/rclone copy "$SOURCE" "$DEST" --update --verbose 2>> "$LOGFILE"


if [ $? -ne 0 ]; then
    notify-send -u critical "Backup FALLITO" "Backup fallito alle $DATE"
fi 
