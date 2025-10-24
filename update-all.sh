#!/bin/bash

# Controllo dei privilegi di root
if [[ $EUID -ne 0 ]]; then
   echo "Questo script deve essere eseguito come root." >&2
   exit 1
fi

echo "=== Aggiornamento pacchetti DNF ==="
dnf check-update > /dev/null 2>&1
DNF_STATUS=$?

if [ $DNF_STATUS -eq 100 ]; then
    echo "→ Aggiornamenti DNF disponibili. Esecuzione di 'dnf upgrade'..."
    dnf upgrade -y

    echo "→ Pulizia pacchetti non più necessari con 'dnf autoremove'..."
    dnf autoremove -y

elif [ $DNF_STATUS -eq 0 ]; then
    echo "→ Il sistema DNF è già aggiornato. Nessuna azione necessaria."
else
    echo "→ Errore durante il controllo aggiornamenti DNF (codice: $DNF_STATUS)."
    exit 1
fi

echo ""
echo "=== Aggiornamento pacchetti Flatpak ==="
FLATPAK_UPDATES=$(flatpak update --appstream -y > /dev/null && flatpak remote-ls --updates)

if [[ -n "$FLATPAK_UPDATES" ]]; then
    echo "→ Aggiornamenti Flatpak disponibili. Esecuzione di 'flatpak update'..."
    flatpak update -y
else
    echo "→ Nessun aggiornamento Flatpak disponibile."
fi
