#!/bin/bash
# run with sudo
# this script installs the access point handler into systemd

echo 'running rotate display service installer'

ROOT_DIR='/usr/local/rotate-display'
SERVICE_FILE='rotate-display.service'
SERVICE_CONFIG="$ROOT_DIR/services/$SERVICE_FILE"

# copy handler file into the system folder to be run by systemd on boot
# if the file doesn't exist
if [ ! -L "/etc/systemd/system/$SERVICE_FILE" ]; then
  ln -s $SERVICE_CONFIG /etc/systemd/system
else
  echo "warning: /etc/systemd/system/$SERVICE_FILE already exists"
fi

# register the script to be run on startup
systemctl enable $SERVICE_FILE

# start up the service
systemctl start $SERVICE_FILE
