Perfekt 👍 Dann passe ich das `.md` so an, dass es direkt zu deinem Repo passt.

Hier ist die aktualisierte Version:

````markdown
# Dynamisches Frontend Starter Kit

## 1. Erklärung

Dieses Projekt ist ein modernes und erweiterbares Starter-Kit für kleine, mehrseitige Web-Anwendungen. Es kombiniert ein sauberes Frontend mit einem minimalistischen Python-Backend (Flask), um dynamische Funktionalitäten wie das serverseitige Speichern von Konfigurationen zu ermöglichen.

Das Kit ist ideal für Prototyping, kleine Projekte oder als Lernplattform, um die Interaktion zwischen Frontend (HTML, CSS, JS) und einem einfachen Backend zu verstehen.

**Kern-Features:**

- **Mehrseitige Struktur:** Organisiert in einem `templates`-Ordner.
- **Python Flask Server:** Ein einfacher Server zum Ausliefern der Seiten und für API-Funktionen.
- **Dynamische Tag-Verwaltung:** Erstellen, Bearbeiten und Löschen von Tags, die in einer `tags.json`-Datei dauerhaft gespeichert werden.
- **Dark Mode:** Ein per Knopfdruck umschaltbares helles und dunkles Design, das im Browser des Benutzers gespeichert wird.
- **Modulare UI-Komponenten:** Wiederverwendbare und einfach zu integrierende UI-Elemente.

---

## 2. Installation und Start

Um das Projekt lokal auszuführen, befolge diese Schritte.

### Voraussetzungen

- **Python 3.6+** muss installiert sein.  
  Überprüfen mit:
  ```bash
  python --version
  # oder
  python3 --version
  ```
````

### Schritt 1: Repository verwenden

Dieses Projekt ist ein **Template-Repository**.
Klicke in GitHub auf **"Use this template"**, um dein eigenes Repository zu erstellen.
Oder klone das Repo direkt:

```bash
git clone https://github.com/oliverschmidt99/frontend-starter-kit.git
cd frontend-starter-kit
```

### Schritt 2: Virtuelle Umgebung erstellen (venv)

Es ist dringend empfohlen, eine virtuelle Umgebung zu verwenden, um die Projekt-Abhängigkeiten isoliert zu halten.

**Linux/macOS:**

```bash
python3 -m venv venv
source venv/bin/activate
```

**Windows (CMD/PowerShell):**

```bash
python -m venv venv
.\venv\Scripts\activate
```

Nach der Aktivierung sollte in deinem Terminal `(venv)` vor dem Pfad stehen.

### Schritt 3: Abhängigkeiten installieren

Installiere die benötigten Python-Pakete (in diesem Fall nur Flask) mit diesem Befehl:

```bash
pip install -r requirements.txt
```

### Schritt 4: Server starten

Starte den Web-Server:

```bash
python app.py
```

Dein Terminal sollte nun eine Ausgabe wie diese anzeigen:

```
 * Running on http://127.0.0.1:5001
```

### Schritt 5: Projekt im Browser öffnen

Öffne deinen Webbrowser und gehe zur Adresse
[http://127.0.0.1:5001](http://127.0.0.1:5001).
Du solltest nun die Startseite der Anwendung sehen.

---

## 3. Verwendete Elemente und Funktionen

Dieses Template enthält mehrere wiederverwendbare UI-Komponenten, die du einfach in neuen Seiten einbauen kannst.

### Komponente: Navigationsleiste mit Dropdown (Navigation-Dropdown)

- **Beschreibung:** Die Hauptnavigation am oberen Rand der Seite. Sie enthält einen animierten Slider, der den aktiven Menüpunkt hervorhebt, sowie ein Dropdown-Menü.
- **Dateien:** `templates/base.html`, `assets/css/style.css`, `assets/js/main.js`
- **Einbau:**
  Die Navigation ist Teil der `base.html` und wird automatisch auf allen Seiten angezeigt, die diese Vorlage erweitern (`{% extends "base.html" %}`).

---

### Komponente: Kachel-Navigation (Tab-Cards)

- **Beschreibung:** Ein System aus klickbaren Karten (Kacheln), die wie Reiter (Tabs) funktionieren, um verschiedene Inhaltsbereiche auf derselben Seite ein- und auszublenden.
- **Dateien:** `templates/tabs_page.html`, `assets/css/style.css`, `assets/js/main.js`
- **Einbau:**

  - HTML-Struktur: Kopiere die

    ```html
    <div class="card-container" id="kachel-nav">...</div>
    <div id="kachel-sektionen">...</div>
    ```

    aus der `tabs_page.html`.

  - JavaScript: Stelle sicher, dass `initializeCardNavigation('kachel-nav', 'kachel-sektionen');` in `main.js` für deine Seite aufgerufen wird.

---

### Komponente: Akkordeon / Aufklapp-Bereiche (Accordion-FAQ)

- **Beschreibung:** Eine Liste von Buttons, die bei Klick einen zugehörigen Inhaltsbereich auf- und zuklappen. Ideal für FAQs.
- **Dateien:** `templates/faq_page.html`, `assets/css/style.css`, `assets/js/main.js`
- **Einbau:**

  - HTML-Struktur: Verwende die `<div class="accordion-container">`-Struktur aus der `faq_page.html`.
    Jedes Element besteht aus einem `<button class="accordion-button">` und einem `<div class="accordion-content">`.
  - JavaScript: Die Funktionalität wird automatisch durch `main.js` bereitgestellt.

---

### Funktion: Tag-Auswahl-Modal (Tag-Selector)

- **Beschreibung:** Ein Modal-Fenster (Pop-up), das es dem Benutzer ermöglicht, Tags aus einer vordefinierten Liste auszuwählen. Die ausgewählten Tags werden auf der Seite angezeigt und können dort auch wieder entfernt werden.
- **Dateien:** `templates/index.html` (als Beispiel), `assets/js/main.js`, `assets/js/tags.js`, `assets/css/style.css`
- **Einbau:**

  - HTML: Füge den Modal-Code (`<div id="tag-modal"> ... </div>`) und den Anzeige-Container (`<div id="tags-selection"> ... </div>`) von `index.html` ein.
  - JavaScript: Rufe `initializeTagSelection();` auf.

---

### Funktion: Tag-Verwaltung & API (Tag-Manager)

- **Beschreibung:** Eine eigene Seite zur Verwaltung von Tag-Kategorien und Tags. Alle Änderungen werden über eine API an den Server gesendet und in der `tags.json` gespeichert.
- **Dateien:** `templates/settings.html`, `assets/js/settings.js`, `app.py`

---

### Funktion: Dark/Light Mode (Theme-Switcher)

- **Beschreibung:** Ein Schalter auf der Einstellungsseite, der das Farbschema der gesamten Anwendung ändert. Die Auswahl wird im Browser des Benutzers gespeichert.
- **Dateien:** `templates/settings.html`, `assets/css/style.css` (via CSS-Variablen), `assets/js/main.js`, `assets/js/settings.js`

```

👉 Soll ich dir daraus direkt eine `README.md` bauen und so formatieren, dass du sie 1:1 in dein Repo legen kannst?
```
