#!/bin/bash
# RLT-Vergleichsrechner – Lokaler Server (Mac)
# Doppelklick im Finder zum Starten

cd "$(dirname "$0")"

echo "╔══════════════════════════════════════════════╗"
echo "║   RLT-Vergleichsrechner – by MM              ║"
echo "║   Lokaler Webserver wird gestartet...        ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# Port
PORT=8765

# Python 3 (auf Mac vorinstalliert ab macOS 12.3)
if command -v python3 &>/dev/null; then
    echo "Python3 gefunden. Server: http://localhost:$PORT"
    echo "Browser wird geöffnet..."
    sleep 1
    open "http://localhost:$PORT"
    python3 -m http.server $PORT
    exit 0
fi

# Python 2 Fallback
if command -v python &>/dev/null; then
    echo "Python gefunden. Server: http://localhost:$PORT"
    sleep 1
    open "http://localhost:$PORT"
    python -m SimpleHTTPServer $PORT
    exit 0
fi

echo "FEHLER: Python nicht gefunden."
echo "Bitte Python installieren: https://www.python.org/downloads/"
echo "Oder im Terminal eingeben:"
echo "  cd $(pwd) && python3 -m http.server 8765"
read -p "Drücken Sie Enter zum Beenden..."
