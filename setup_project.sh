#!/bin/bash

echo "🚀 Starte das Setup für das WebScaffold-Projekt im aktuellen Verzeichnis..."
echo "---"

# --- 1. Verzeichnisstruktur erstellen (sicher, erstellt nur, was fehlt) ---
echo "Erstelle Verzeichnisstruktur: assets/css, assets/js, assets/icons"
mkdir -p assets/{css,js,icons}
echo "---"

# --- 2. Icons erstellen (inklusive Favicon und aller benötigten Symbole) ---
echo "Erstelle alle SVG-Icons..."
ICON_DIR="assets/icons"

# favicon.svg
cat << 'EOF' > "$ICON_DIR/favicon.svg"
<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="#007bff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2L2 7l10 5 10-5-10-5z"></path><path d="M2 17l10 5 10-5"></path><path d="M2 12l10 5 10-5"></path></svg>
EOF

# icon_stop.svg
cat << 'EOF' > "$ICON_DIR/icon_stop.svg"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect></svg>
EOF

# icon_chevron_down.svg
cat << 'EOF' > "$ICON_DIR/icon_chevron_down.svg"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"></polyline></svg>
EOF

# icon_home.svg
cat << 'EOF' > "$ICON_DIR/icon_home.svg"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
EOF

# icon_layers.svg
cat << 'EOF' > "$ICON_DIR/icon_layers.svg"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
EOF

# icon_settings.svg
cat << 'EOF' > "$ICON_DIR/icon_settings.svg"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9h.09a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
EOF

# icon_drag_and_drop.svg
cat << 'EOF' > "$ICON_DIR/icon_drag_and_drop.svg"
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg>
EOF

echo "Alle Icons erfolgreich erstellt."
echo "---"


# --- 3. CSS-Dateien erstellen ---
echo "Erstelle CSS-Dateien..."
cat << 'EOF' > "assets/css/style.css"
@import url('components.css');
:root { --primary-color: #007bff; --primary-hover: #0056b3; --secondary-color: #6c757d; --secondary-hover: #5a6268; --success-color: #28a745; --error-color: #dc3545; --warning-color: #ffc107; --background-color: #f8f9fa; --text-color: #212529; --card-bg: #fff; --border-color: #dee2e6; --shadow: 0 4px 6px rgba(0,0,0,0.07); }
html[data-theme='dark'] { --background-color: #212529; --text-color: #e9ecef; --card-bg: #2c3034; --border-color: #495057; --secondary-color: #495057; --secondary-hover: #6c757d; }
body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; line-height: 1.6; margin: 0; padding: 0; background-color: var(--background-color); color: var(--text-color); transition: background-color 0.2s, color 0.2s; }
main { padding: 2rem; max-width: 1200px; margin: 0 auto; }
header { background-color: var(--card-bg); padding: 0 2rem; text-align: center; box-shadow: var(--shadow); border-bottom: 1px solid var(--border-color); height: 60px; display: flex; justify-content: center; align-items: center; }
footer { text-align: center; padding: 2rem; margin-top: 2rem; background-color: var(--card-bg); border-top: 1px solid var(--border-color); }
nav ul { padding: 0; margin: 0; list-style: none; display: flex; gap: 1rem; }
nav ul li { position: relative; }
nav ul li a { display: flex; align-items: center; gap: 0.5rem; padding: 0.5rem 1rem; border-radius: 6px; color: var(--text-color); text-decoration: none; font-weight: 500; transition: background-color 0.2s, color 0.2s; }
nav ul li a:hover, nav ul li a.active { background-color: var(--primary-color); color: white; }
nav ul li a img { width: 18px; height: 18px; }
nav ul li a:hover img, nav ul li a.active img { filter: brightness(0) invert(1); }
.dropdown-menu { display: none; position: absolute; top: 100%; left: 0; list-style: none; padding: 0.5rem 0; margin-top: 0.5rem; background-color: var(--card-bg); border-radius: 6px; box-shadow: var(--shadow); min-width: 200px; z-index: 100; }
.dropdown-menu li a { width: 100%; box-sizing: border-box; }
nav ul li:hover .dropdown-menu { display: block; }
.container { background-color: var(--card-bg); padding: 2rem; border-radius: 8px; box-shadow: var(--shadow); }
h1, h2 { margin-top: 0; }
.accordion-container { margin-top: 1rem; }
.accordion-button { background-color: var(--background-color); color: var(--text-color); cursor: pointer; padding: 1rem; width: 100%; border: none; border-top: 1px solid var(--border-color); text-align: left; outline: none; transition: background-color 0.2s; }
.accordion-button.active, .accordion-button:hover { background-color: #e9ecef; }
html[data-theme='dark'] .accordion-button.active, html[data-theme='dark'] .accordion-button:hover { background-color: #343a40; }
.accordion-content { padding: 0 1rem; background-color: var(--card-bg); max-height: 0; overflow: hidden; transition: max-height 0.3s ease-out; }
EOF

cat << 'EOF' > "assets/css/components.css"
.card { padding: 1.5rem; margin-bottom: 1.5rem; border-radius: 8px; border: 1px solid var(--border-color); background-color: var(--card-bg); box-shadow: var(--shadow); }
.button { display: inline-flex; align-items: center; justify-content: center; gap: 0.6rem; cursor: pointer; border: none; text-decoration: none; padding: 0.7rem 1.4rem; border-radius: 6px; font-weight: 500; font-size: 1rem; transition: all 0.2s; background-color: var(--primary-color); color: white; }
.button:hover { background-color: var(--primary-hover); transform: translateY(-2px); }
.button.secondary { background-color: var(--secondary-color); color: white; }
.button.secondary:hover { background-color: var(--secondary-hover); }
.button.danger { background-color: var(--error-color); color: white; }
.button.danger:hover { background-color: #c82333; }
.button-group { display: flex; flex-wrap: wrap; gap: 1rem; margin-top: 1.5rem; }
.modal-overlay { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.6); justify-content: center; align-items: center; z-index: 1000; }
.modal-content { background-color: var(--card-bg); padding: 2rem; border-radius: 8px; box-shadow: 0 5px 15px rgba(0,0,0,0.3); width: 90%; max-width: 600px; }
.modal-header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--border-color); margin-bottom: 1.5rem; padding-bottom: 1rem; }
.modal-close-btn { background: none; border: none; font-size: 1.8rem; cursor: pointer; color: #6c757d; padding: 0; line-height: 1; }
.modal-actions { text-align: right; margin-top: 2rem; padding-top: 1.5rem; border-top: 1px solid var(--border-color); }
#toast-container { position: fixed; top: 20px; right: 20px; z-index: 1050; display: flex; flex-direction: column; gap: 10px; }
.toast { background-color: var(--card-bg); padding: 15px 20px; border-radius: 5px; box-shadow: var(--shadow); opacity: 0; transition: opacity 0.3s, transform 0.3s; transform: translateX(100%); }
.toast.show { opacity: 1; transform: translateX(0); }
.toast.success { border-left: 5px solid var(--success-color); }
.toast.error { border-left: 5px solid var(--error-color); }
.toast.info { border-left: 5px solid var(--primary-color); }
.card-margin-top { margin-top: 2rem; }
.button img { display: block; line-height: 0; }
.accordion-button { display: flex; justify-content: space-between; align-items: center; }
.accordion-button .icon-chevron { transition: transform 0.3s ease; }
.accordion-button.active .icon-chevron { transform: rotate(180deg); }
EOF

cat << 'EOF' > "assets/css/settings.css"
.switch { position: relative; display: inline-block; width: 60px; height: 34px; }
.switch input { opacity: 0; width: 0; height: 0; }
.slider { position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0; background-color: #ccc; transition: .4s; }
.slider:before { position: absolute; content: ""; height: 26px; width: 26px; left: 4px; bottom: 4px; background-color: white; transition: .4s; }
input:checked+.slider { background-color: var(--primary-color); }
.slider.round { border-radius: 34px; }
.slider.round:before { border-radius: 50%; }
.setting-item { display: flex; align-items: center; justify-content: space-between; }
EOF
echo "CSS-Dateien erstellt."
echo "---"

# --- 4. JS-Dateien erstellen ---
echo "Erstelle JavaScript-Dateien..."
cat << 'EOF' > "assets/js/main.js"
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll(".accordion-button").forEach(button => {
        button.addEventListener("click", () => {
            const content = button.nextElementSibling;
            button.classList.toggle("active");
            content.style.maxHeight = button.classList.contains("active") ? content.scrollHeight + "px" : null;
        });
    });
});
EOF

cat << 'EOF' > "assets/js/settings.js"
document.addEventListener("DOMContentLoaded", () => {
    const themeToggle = document.getElementById("theme-toggle");
    const applyTheme = (theme) => {
        document.documentElement.setAttribute('data-theme', theme);
        localStorage.setItem('theme', theme);
        if (themeToggle) themeToggle.checked = (theme === 'dark');
    };
    applyTheme(localStorage.getItem('theme') || 'light');
    if (themeToggle) {
        themeToggle.addEventListener("change", () => {
            applyTheme(themeToggle.checked ? "dark" : "light");
        });
    }
});
EOF
echo "JavaScript-Dateien erstellt."
echo "---"


# --- 5. HTML-Dateien erstellen (mit Variablen für aktive Links) ---
echo "Erstelle HTML-Dateien..."
HTML_HEAD='<!DOCTYPE html>\n<html lang="de">\n<head>\n    <meta charset="UTF-8">\n    <meta name="viewport" content="width=device-width, initial-scale=1.0">\n    <link rel="icon" href="assets/icons/favicon.svg" type="image/svg+xml">'
FOOTER='<footer><p>&copy; 2025 Dein Name</p></footer>'
NAV_TEMPLATE='<body>\n    <header>\n        <nav>\n            <ul>\n                <li><a href="index.html" class="{{INDEX_ACTIVE}}"><img src="assets/icons/icon_home.svg" alt="" width="18" height="18"> <span>Startseite</span></a></li>\n                <li>\n                    <a href="examples.html" class="{{EXAMPLES_ACTIVE}}"><img src="assets/icons/icon_layers.svg" alt="" width="18" height="18"> <span>Beispiele</span></a>\n                    <ul class="dropdown-menu">\n                        <li><a href="example-subpage.html">Beispiel Unterseite 1</a></li>\n                    </ul>\n                </li>\n                <li><a href="settings.html" class="{{SETTINGS_ACTIVE}}"><img src="assets/icons/icon_settings.svg" alt="" width="18" height="18"> <span>Einstellungen</span></a></li>\n                <li><a href="drag-and-drop.html" class="{{DND_ACTIVE}}"><img src="assets/icons/icon_drag_and_drop.svg" alt="" width="18" height="18"> <span>Drag &amp; Drop</span></a></li>\n            </ul>\n        </nav>\n    </header>'

# index.html
NAV=$(echo -e "$NAV_TEMPLATE" | sed 's/{{INDEX_ACTIVE}}/active/g' | sed 's/{{[A-Z_]*_ACTIVE}}//g')
echo -e "$HTML_HEAD\n    <title>Startseite</title>\n    <link rel=\"stylesheet\" href=\"assets/css/style.css\">\n</head>\n$NAV\n    <main class=\"container\">\n        <h1>WebScaffold</h1>\n        <p>Ein modernes Grundgerüst für deine Frontend-Projekte.</p>\n    </main>\n$FOOTER\n    <script src=\"assets/js/main.js\"></script>\n</body>\n</html>" > index.html

# examples.html
NAV=$(echo -e "$NAV_TEMPLATE" | sed 's/{{EXAMPLES_ACTIVE}}/active/g' | sed 's/{{[A-Z_]*_ACTIVE}}//g')
echo -e "$HTML_HEAD\n    <title>UI-Beispiele</title>\n    <link rel=\"stylesheet\" href=\"assets/css/style.css\">\n</head>\n$NAV\n    <main class=\"container\">\n        <h1>UI-Komponenten</h1>\n <div class=\"card card-margin-top\"><h2>Aufklappbare Bereiche</h2><div class=\"accordion-container\"><button type=\"button\" class=\"accordion-button\"><span>Element 1</span><img src=\"assets/icons/icon_chevron_down.svg\" alt=\"\" width=\"20\" height=\"20\" class=\"icon-chevron\"></button><div class=\"accordion-content\"><p>Inhalt des Elements.</p></div></div></div>       <div class=\"card card-margin-top\">\n            <h2>Buttons</h2>\n            <div class=\"button-group\">\n                <button type=\"button\" class=\"button danger\" title=\"Stopp\"><img src=\"assets/icons/icon_stop.svg\" alt=\"Stopp\" width=\"20\" height=\"20\"><span>Stopp</span></button>\n            </div>\n        </div>\n    </main>\n$FOOTER\n    <script src=\"assets/js/main.js\"></script>\n</body>\n</html>" > examples.html

# example-subpage.html
NAV=$(echo -e "$NAV_TEMPLATE" | sed 's/{{EXAMPLES_ACTIVE}}/active/g' | sed 's/{{[A-Z_]*_ACTIVE}}//g')
echo -e "$HTML_HEAD\n    <title>Beispiel Unterseite</title>\n    <link rel=\"stylesheet\" href=\"assets/css/style.css\">\n</head>\n$NAV\n    <main class=\"container\">\n        <h1>Beispiel Unterseite 1</h1>\n        <p>Diese Seite wurde über das Dropdown-Menü erreicht.</p>\n    </main>\n$FOOTER\n    <script src=\"assets/js/main.js\"></script>\n</body>\n</html>" > example-subpage.html

# settings.html
NAV=$(echo -e "$NAV_TEMPLATE" | sed 's/{{SETTINGS_ACTIVE}}/active/g' | sed 's/{{[A-Z_]*_ACTIVE}}//g')
echo -e "$HTML_HEAD\n    <title>Einstellungen</title>\n    <link rel=\"stylesheet\" href=\"assets/css/style.css\">\n <link rel=\"stylesheet\" href=\"assets/css/settings.css\">\n</head>\n$NAV\n    <main class=\"container\">\n        <h1>Einstellungen</h1>\n        <div class=\"card\">\n            <h2>Design</h2>\n            <div class=\"setting-item\">\n                <label for=\"theme-toggle\">Dark Mode</label>\n                <label class=\"switch\"><input type=\"checkbox\" id=\"theme-toggle\" role=\"switch\"><span class=\"slider round\"></span></label>\n            </div>\n        </div>\n    </main>\n$FOOTER\n    <script src=\"assets/js/settings.js\"></script>\n</body>\n</html>" > settings.html

# drag-and-drop.html
NAV=$(echo -e "$NAV_TEMPLATE" | sed 's/{{DND_ACTIVE}}/active/g' | sed 's/{{[A-Z_]*_ACTIVE}}//g')
echo -e "$HTML_HEAD\n    <title>Drag &amp; Drop</title>\n    <link rel=\"stylesheet\" href=\"assets/css/style.css\">\n <style>#sortable-list { list-style: none; padding: 0; } #sortable-list li { padding: 15px; margin-bottom: 10px; background-color: var(--background-color); border: 1px solid var(--border-color); border-radius: 5px; cursor: grab; } .sortable-ghost { opacity: 0.4; background-color: #e3f2fd; }</style>\n</head>\n$NAV\n    <main class=\"container\">\n        <h1>Drag &amp; Drop</h1>\n        <ul id=\"sortable-list\">\n            <li>Element Alpha</li>\n            <li>Element Beta</li>\n        </ul>\n    </main>\n$FOOTER\n    <script src=\"https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js\"></script>\n    <script src=\"assets/js/main.js\"></script>\n</body>\n</html>" > drag-and-drop.html

echo "HTML-Dateien erstellt."
echo "---"

# --- 6. README erstellen ---
echo "Erstelle README.md..."
cat << 'EOF' > README.md
# WebScaffold

Ein modernes und leichtgewichtiges Grundgerüst für den schnellen Start von Frontend-Projekten.

## Features

- **Mehrseitige Struktur** mit Dropdown-Navigation.
- **Modernes Design** mit Dark-Mode.
- **UI-Komponenten**: Buttons, Cards, Modals, Toasts, Akkordeon.
- **Drag & Drop** Funktionalität via Sortable.js.
- **Organisierte Dateistruktur**.

## Anwendung

1.  **Anpassen**: Bearbeite die `.html`, `.css` und `.js` Dateien.
2.  **Starten**: Öffne `index.html` im Browser oder nutze einen lokalen Server (`python3 -m http.server`).
EOF
echo "README.md erstellt."
echo "---"

echo "✅ Projekt-Setup erfolgreich abgeschlossen!"