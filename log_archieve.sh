#!/usr/bin/env sh

LOG_DIR="/var/log/*"

USR_LOG_DIR=""

# Create a filename in the format : logs_archive_{date/Month/year_hour/minute/seconds}
LOG_FILE_NAME="logs_archive_$(date +'%Y%m%d_%H%M%S').tar.gz"

createArchive()
{
    echo "Collecting logs from $LOG_DIR..."
    
    # creates temp dir and copy contents to temp dir and archive to location specified.
    if [[ -e "./tmp/" ]]; then
        rm -rf ./tmp/*
    else
        mkdir ./tmp/
    fi 
    cp -r $LOG_DIR ./tmp/
    cd ./tmp/
    tar -czf $USR_LOG_DIR$LOG_FILE_NAME .
    rm ./tmp/
    echo "logged."
}


if [[ $1 ]]; then
    USR_LOG_DIR=$1
    if [[ -e $USR_LOG_DIR ]]; then
        createArchive
    else
    echo "Invalid file path. Please try again"
    fi
fi

# use below command to extract the file 
# tar -xzf logs_archive_20250720_204412.tar.gz -C ./extract
