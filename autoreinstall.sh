#!/bin/bash

# Colors variable definitions
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
RESET="\033[0m"

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
    echo "⛔️  Execution stopped"
    exit 0
}

echo "🔵 sudo is required to reinstall Nvidia drivers."

#  Purge all Nvidia drivers
sudo apt purge *nvidia* -y

# Purge drivers not handeled by the "*nvidia*"
sudo apt purge libnvidia-compute-*:i386 libnvidia-decode-*:i386 libnvidia-encode-*:i386 libnvidia-fbc1-*:i386 screen-resolution-extra -y
sudo apt purge libnvidia-compute-*:amd64 libnvidia-decode-*:amd64 libnvidia-encode-*:amd64 libnvidia-fbc1-*:amd64 screen-resolution-extra -y

# Auto remove unnecessary packages
sudo apt autoremove -y

# Auto install drivers
sudo ubuntu-drivers autoinstall

# Sucess message
printf "\n\n✅ ${GREEN}Nvidia drivers successfully auto reinstalled${RESET}\n\n"


# Argument handling
while test $# -gt 0
do
    case "$1" in
        --reboot | -r) echo "Rebooting..." && sudo reboot 
            ;;
    *) printf "${YELLOW}⚠️  Unsupported argument: ${CYAN}$1${RESET}\n\n"
            ;;
    esac
    shift
done

printf "🟡  You must ${RED}reboot${RESET} yout computer to appliy changes.\n"

exit 0