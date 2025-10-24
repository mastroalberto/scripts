#!/bin/bash
# ======================================
# MastroAlberto - file generated on 10/24/2025 
# contact: alberto.bella@protonmail.com
# ======================================


# IMPORTANT READ BEFORE USE 
# modify this values for your system, the logfile MUST be created before launching the script 
# otherwise no log will be collected. 
# notify-send should work in all system configuration if does not open an issue on github. 

SOURCE='<your_source>'
DEST='<path_to_your_rclone>'
LOGFILE='<log_file_location>'

DATE=$(date "+%Y-%m-%d %H:%M:%S")

/usr/bin/rclone copy "$SOURCE" "$DEST" --update --verbose 2>> "$LOGFILE"


if [ $? -ne 0 ]; then
    notify-send -u critical "Backup FAILED" "Backup failed on $DATE"
fi 
