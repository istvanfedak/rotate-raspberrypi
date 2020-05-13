Simple script for rotating a RaspberryPi via a GraphQl API

Each time you query the endpoint the display will be rotated after reboot

## Prerequisits
- Raspbian Buster
- NodeJs verison 10 or greater

## Installation
- Clone this repository:
  `git clone https://github.com/istvanfedak/rotate-raspberrypi ~/rotate-display`
- Install NodeJs packages:
  `cd ~/rotate-display && npm install`
- Install service:
  `sudo bash install.sh`

## Uninstallation
- Uninstall service:
  `sudo bash uninstall.sh`
- Remove the repository
  `rm -rf ~/rotate-display`

# Usage
TODO
