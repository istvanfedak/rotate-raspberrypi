#!/bin/bash
# run with sudo
# global installer for the package

echo 'running script installer'

PACKAGE_PATH_NAME='/usr/local/rotate-display'
WORKING_DIR=$(pwd)

# create symbolic link in the package directory to the current directory
if [ ! -L $PACKAGE_PATH_NAME ]; then
  ln -s $WORKING_DIR $PACKAGE_PATH_NAME
  echo "$PACKAGE_PATH_NAME symbolic link created to $WORKING_DIR"
else
  echo "warning: symbolic link to $WORKING_DIR already exists"
fi

# install rotate display service
bash $PACKAGE_PATH_NAME/scripts/install-rotate-display-service.sh

