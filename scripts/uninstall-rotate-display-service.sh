#!/bin/bash
# run with sudo
# this script uinstalls the rotate display service from systemd

ROOT_DIR='/usr/local/rotate-display'
SERVICE_FILE='rotate-display.service'
SERVICE_PATH_NAME="$ROOT_DIR/services/$SERVICE_FILE"

# stop the service 
systemctl stop $SERVICE_FILE

# unregister the script to be run on startup
systemctl disable $SERVICE_FILE

# remove the file from the systemd systems dir if it exists
if [ -L "/etc/systemd/system/$SERVICE_FILE" ]; then
  unlink /etc/systemd/system/$SERVICE_FILE
  echo "/etc/systemd/system/$SERVICE_FILE unlinked"
fi
