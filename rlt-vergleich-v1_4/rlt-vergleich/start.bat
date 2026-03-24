@echo off
title RLT-Vergleichsrechner – Lokaler Server
echo.
echo  ╔══════════════════════════════════════════════╗
echo  ║   RLT-Vergleichsrechner – by MM              ║
echo  ║   Lokaler Webserver wird gestartet...        ║
echo  ╚══════════════════════════════════════════════╝
echo.

REM Prüfe ob Python verfügbar ist
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo  Python gefunden. Server startet auf http://localhost:8765
    echo  Browser wird geöffnet...
    echo  [Fenster schließen zum Beenden]
    echo.
    start "" http://localhost:8765
    python -m http.server 8765
    goto end
)

python3 --version >nul 2>&1
if %errorlevel% == 0 (
    echo  Python3 gefunden. Server startet auf http://localhost:8765
    start "" http://localhost:8765
    python3 -m http.server 8765
    goto end
)

REM Python nicht gefunden - Node.js versuchen
node --version >nul 2>&1
if %errorlevel% == 0 (
    echo  Node.js gefunden. Server startet auf http://localhost:8765
    start "" http://localhost:8765
    node -e "const h=require('http'),fs=require('fs'),p=require('path');h.createServer((q,s)=>{let f=p.join('.',q.url==='/'?'/index.html':q.url);try{const d=fs.readFileSync(f);const m={'html':'text/html','js':'application/javascript','json':'application/json','png':'image/png','css':'text/css'};s.writeHead(200,{'Content-Type':m[f.split('.').pop()]||'text/plain','Access-Control-Allow-Origin':'*'});s.end(d);}catch(e){s.writeHead(404);s.end('Not found');}}).listen(8765);" 
    goto end
)

echo.
echo  ╔══════════════════════════════════════════════╗
echo  ║  FEHLER: Python oder Node.js nicht gefunden  ║
echo  ║                                              ║
echo  ║  Bitte installieren:                         ║
echo  ║  https://www.python.org/downloads/           ║
echo  ║  (Python empfohlen, kostenlos)               ║
echo  ╚══════════════════════════════════════════════╝
pause

:end
