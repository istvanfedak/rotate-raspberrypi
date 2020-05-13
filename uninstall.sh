#!/bin/bash
# run with sudo
# global uninstaller for the package

PACKAGE_PATH_NAME='/usr/local/rotate-display'

# run the package installer
if [ -L $PACKAGE_PATH_NAME ]; then
  echo "running service uninstaller"
  bash $PACKAGE_PATH_NAME/scripts/uninstall-rotate-display-service.sh

  # remove symbolic link in the package directory  
  unlink $PACKAGE_PATH_NAME
  echo "$PACKAGE_PATH_NAME symbolic link removed"
else
  echo "error: symbolic link is broken"
  echo "  cannot find the path to the uninstaller"
  echo '  uninstaller path:'
  echo "    $PACKAGE_PATH_NAME/script/uninstall-rotate-display-service.sh"
  echo ''
  echo "restore the link and run this script again to uninstall"
  echo "symbolic link: $PACKAGE_PATH_NAME -> $(pwd)"
fi
