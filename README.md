# Frontend Starter Kit

Ein generisches und wiederverwendbares Template für den schnellen Start von kleinen, mehrseitigen Web-Projekten.

## Features

- **Mehrseitige Struktur**: Enthält Vorlagen für eine Startseite (`index.html`) und weitere Unterseiten.
- **Modernes Design**: Klare und aufgeräumte Optik mit einem freundlichen Farbschema.
- **Responsive**: Der Hauptinhaltsbereich passt sich dank prozentualer Breiten an verschiedene Bildschirmgrößen an.
- **Interaktive UI-Komponenten**:
  - Buttons, Eingabefelder und Dropdown-Menüs
  - Auf- und zuklappbare Inhaltsbereiche (Akkordeon)
- **Organisierte Dateistruktur**: Trennung von HTML, CSS und JavaScript in separaten Ordnern.

## Projektstruktur

/
|-- index.html # Startseite
|-- seite2.html # Vorlage für eine Unterseite
|-- seite3.html # Beispielseite mit aufklappbaren Bereichen (Hilfe/FAQ)
|-- README.md # Diese Datei
|
|-- /assets
|-- /css
| |-- style.css # Alle Stile für das Projekt
|
|-- /js
|-- main.js # Globale JavaScript-Logik

## Anwendung

1.  **Herunterladen/Klonen**: Lade die Dateien herunter oder klone das Repository.
2.  **Inhalte anpassen**: Öffne die `.html`-Dateien und ersetze die Platzhalter-Texte durch deine eigenen Inhalte.
3.  **Stile anpassen**: Ändere Farben, Schriftarten und Layout in der Datei `assets/css/style.css`.
4.  **Logik hinzufügen**: Ergänze deine eigene Funktionalität in `assets/js/main.js`.
5.  **Neue Seiten**: Um eine neue Seite zu erstellen, kopiere am besten `seite2.html`, benenne die Datei um und verlinke sie in der Navigation (`<header>`) der anderen Seiten.

## Anpassung

- **Farbschema**: Die Hauptfarben (Header, Buttons) sind am Anfang der `style.css` in den Selektoren `header` und `button` definiert und können dort leicht geändert werden.
- **Schriftart**: Die globale Schriftart wird im `body`-Selektor in `style.css` festgelegt.

---

Dieses Template wurde erstellt, um einen schnellen und unkomplizierten Einstieg in neue Web-Projekte zu ermöglichen.
