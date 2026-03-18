# Mischluftrechner – Android App
**by Maximum Machines GmbH**

## Schnellstart in Android Studio

1. **Android Studio öffnen**
2. **"Open"** → diesen Ordner `MischluftrechnerApp` auswählen
3. **Warten** bis Gradle sync abgeschlossen (ca. 1-2 Min, Internetverbindung nötig)
4. **Handy anschließen** (USB, Entwickleroptionen + USB-Debugging aktiviert)
5. **▶ Run** drücken → App wird installiert

## Entwickleroptionen auf Android aktivieren
- Einstellungen → Über das Telefon → Build-Nummer 7x tippen
- Einstellungen → Entwickleroptionen → USB-Debugging: EIN

## APK direkt bauen (ohne Handy)
- Build → Build Bundle(s)/APK(s) → Build APK(s)
- APK liegt in: `app/build/outputs/apk/debug/app-debug.apk`
- Per ADB installieren: `adb install app-debug.apk`

## Technische Details
- **Min Android:** 8.0 (API 26)
- **Target Android:** 14 (API 34)
- **Architektur:** WebView-App (index.html aus assets)
- **Offline-fähig:** Ja, keine Internetverbindung nötig
- **Paketname:** de.mmrlt.mischluft

## Projektstruktur
```
app/src/main/
├── assets/
│   └── index.html          ← Die komplette App
├── java/de/mmrlt/mischluft/
│   └── MainActivity.java   ← WebView-Wrapper
├── res/
│   ├── layout/activity_main.xml
│   ├── values/ (strings, themes, colors)
│   └── mipmap-*/ic_launcher*.png
└── AndroidManifest.xml
```
