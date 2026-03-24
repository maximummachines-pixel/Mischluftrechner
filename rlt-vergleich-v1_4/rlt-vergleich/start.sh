#!/bin/bash
# RLT-Vergleichsrechner – Lokaler Server (Linux)
cd "$(dirname "$0")"
PORT=8765
if command -v python3 &>/dev/null; then
    echo "Server startet auf http://localhost:$PORT"
    xdg-open "http://localhost:$PORT" 2>/dev/null &
    python3 -m http.server $PORT
elif command -v python &>/dev/null; then
    echo "Server startet auf http://localhost:$PORT"
    xdg-open "http://localhost:$PORT" 2>/dev/null &
    python -m SimpleHTTPServer $PORT
else
    echo "Python nicht gefunden. Bitte installieren: sudo apt install python3"
fi
