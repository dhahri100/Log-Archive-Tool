#!/bin/bash
log_dir="$1"
#------------Vérifiez---------------------
if [ -z "$log_dir" ]; then
	    echo "Usage: $0 <log_directory>"
	        exit 1
fi

if [ ! -d "$log_dir" ]; then
	    echo "Error: Log directory '$log_dir' does not exist."
	        exit 1
fi
#-------------timestamp--------------------
timestamp=$(date +%Y%m%d_%H%M%S)
archive_dir="archive_$timestamp"
mkdir "$archive_dir"
#---------------Compression et archivage------------------
tar -czvf "$archive_dir/logs_archive_$timestamp.tar.gz" -C "$log_dir" .
#---------------Enregistrement de la date et de l'heure------------------
echo "Archived logs on: $(date)" > "$archive_dir/archive_log.txt"

