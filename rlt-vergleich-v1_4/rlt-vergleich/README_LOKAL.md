# RLT-Vergleichsrechner – Lokale Nutzung

## Schnellstart

| Betriebssystem | Aktion |
|---|---|
| **Windows** | `start.bat` doppelklicken |
| **Mac** | `start.command` doppelklicken (beim ersten Mal: Rechtsklick → Öffnen) |
| **Linux** | Terminal: `bash start.sh` |

Der Browser öffnet sich automatisch auf `http://localhost:8765`.

## Voraussetzung

**Python** muss installiert sein (meistens bereits vorhanden):
- Windows: https://www.python.org/downloads/ (bei Installation „Add to PATH" ankreuzen)
- Mac: ab macOS 12.3 vorinstalliert
- Linux: `sudo apt install python3`

## Warum kein Doppelklick auf index.html?

Browser blockieren API-Aufrufe von lokalen Dateien (Sicherheitsregel namens CORS).
Der Mini-Webserver umgeht das – er läuft nur auf Ihrem Computer, keine Daten gehen ins Internet außer den API-Aufrufen an Anthropic.

## Beenden

Startskript-Fenster schließen oder `Strg+C` drücken.
