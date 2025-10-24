#!/bin/bash

# =============================================
# Mastroalberto - file generated on 10/24/2025
# contact: alberto.bella@protonmail.com 
# =============================================

# Checking root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." >&2
   exit 1
fi

echo "=== DNF package update ==="
dnf check-update > /dev/null 2>&1
DNF_STATUS=$?

if [ $DNF_STATUS -eq 100 ]; then
    echo "→ DNF updates available. Running 'dnf upgrade'..."
    dnf upgrade -y

    echo "→ Cleaning up unnecessary packages with 'dnf autoremove'..."
    dnf autoremove -y

elif [ $DNF_STATUS -eq 0 ]; then
    echo "→ The DNF system is already up to date. No action needed."
else
    echo "→ Error while checking DNF updates (codice: $DNF_STATUS)."
    exit 1
fi

echo ""
echo "=== Flatpak package update ==="
FLATPAK_UPDATES=$(flatpak update --appstream -y > /dev/null && flatpak remote-ls --updates)

if [[ -n "$FLATPAK_UPDATES" ]]; then
    echo "→ Flatpak updates available. Running 'flatpak update'..."
    flatpak update -y
else
    echo "→ No Flatpak updates available."
fi
