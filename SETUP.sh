#!/bin/bash

# Dieses finale Skript baut das WebScaffold-Projekt von Grund auf neu auf.
# Es enthält alle gewünschten Anpassungen und eine vollständige Komponentenvorführung.

echo "🚀 Erstelle das finale, vollständige WebScaffold-Projekt..."
echo "---"

# --- 1. VERZEICHNISSE ERSTELLEN ---
mkdir -p assets/{css,js,icons}

# --- 2. ICONS ERSTELLEN (INKLUSIVE DRAG HANDLE) ---
echo "✅ Erstelle Icons..."
cat << 'EOF' > assets/icons/favicon.svg
<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="#007bff" stroke-width="2"><path d="M12 2L2 7l10 5 10-5-10-5z"></path><path d="M2 17l10 5 10-5"></path><path d="M2 12l10 5 10-5"></path></svg>
EOF
cat << 'EOF' > assets/icons/icon_home.svg
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
EOF
cat << 'EOF' > assets/icons/icon_layers.svg
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
EOF
cat << 'EOF' > assets/icons/icon_settings.svg
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9h.09a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
EOF
cat << 'EOF' > assets/icons/icon_drag_and_drop.svg
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg>
EOF
cat << 'EOF' > assets/icons/icon_chevron_down.svg
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"></polyline></svg>
EOF
cat << 'EOF' > assets/icons/icon_drag_handle.svg
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
EOF

# --- 3. JAVASCRIPT-DATEIEN ERSTELLEN (MIT MODAL/TOAST LOGIK) ---
echo "✅ Erstelle JavaScript-Dateien..."
cat << 'EOF' > assets/js/theme.js
(function(){function e(e){document.documentElement.setAttribute("data-theme",e)}const t=localStorage.getItem("theme")||"light";e(t),document.addEventListener("DOMContentLoaded",()=>{const o=document.getElementById("theme-toggle");o&&(o.checked="dark"===t,o.addEventListener("change",()=>{const t=o.checked?"dark":"light";localStorage.setItem("theme",t),e(t)}))})})();
EOF
cat << 'EOF' > assets/js/main.js
document.addEventListener("DOMContentLoaded", () => {
    // Accordion Logic
    document.querySelectorAll(".accordion-button").forEach(button => {
        button.addEventListener("click", () => {
            button.classList.toggle("active");
            const content = button.nextElementSibling;
            content.style.maxHeight = button.classList.contains("active") ? content.scrollHeight + "px" : null;
        });
    });

    // Modal Logic
    const modal = document.getElementById("demo-modal");
    const openModalBtn = document.getElementById("open-modal-btn");
    const closeModalBtn = document.querySelector(".modal-close-btn");
    if (modal && openModalBtn && closeModalBtn) {
        const openModal = () => modal.style.display = "flex";
        const closeModal = () => modal.style.display = "none";
        openModalBtn.addEventListener("click", openModal);
        closeModalBtn.addEventListener("click", closeModal);
        window.addEventListener("click", (event) => {
            if (event.target === modal) closeModal();
        });
    }

    // Toast Logic
    const toastContainer = document.getElementById("toast-container");
    function showToast(message, type = "info") {
        if (!toastContainer) return;
        const toast = document.createElement("div");
        toast.className = `toast ${type}`;
        toast.textContent = message;
        toastContainer.appendChild(toast);
        setTimeout(() => toast.classList.add("show"), 10);
        setTimeout(() => {
            toast.classList.remove("show");
            setTimeout(() => toast.remove(), 300);
        }, 3000);
    }
    document.getElementById("toast-success-btn")?.addEventListener("click", () => showToast("Aktion erfolgreich ausgeführt!", "success"));
    document.getElementById("toast-error-btn")?.addEventListener("click", () => showToast("Ein Fehler ist aufgetreten.", "error"));
    document.getElementById("toast-info-btn")?.addEventListener("click", () => showToast("Dies ist eine Information.", "info"));
});
EOF

# --- 4. CSS-DATEIEN ERSTELLEN (NEUER DARKMODE, MODAL/TOAST STYLES) ---
echo "✅ Erstelle CSS-Dateien..."
cat << 'EOF' > assets/css/style.css
@import url('components.css');
:root { --primary-color: #007bff; --primary-hover: #0056b3; --secondary-color: #6c757d; --secondary-hover: #5a6268; --success-color: #28a745; --error-color: #dc3545; --background-color: #f8f9fa; --text-color: #212529; --card-bg: #fff; --border-color: #dee2e6; --shadow: 0 4px 6px rgba(0,0,0,0.07); }
/* ANPASSUNG: Hellerer, angenehmerer Dark Mode */
html[data-theme='dark'] { --background-color: #343a40; --text-color: #e9ecef; --card-bg: #495057; --border-color: #6c757d; --secondary-color: #6c757d; --secondary-hover: #5a6268; }
body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; line-height: 1.6; margin: 0; padding: 0; background-color: var(--background-color); color: var(--text-color); transition: background-color 0.2s, color 0.2s; }
main { padding: 2rem; max-width: 1200px; margin: 0 auto; }
header { background-color: var(--card-bg); padding: 0 2rem; box-shadow: var(--shadow); border-bottom: 1px solid var(--border-color); height: 60px; display: flex; justify-content: center; align-items: center; }
/* ANPASSUNG: Fußzeile zentriert */
footer { text-align: center; padding: 2rem; margin-top: 2rem; background-color: var(--card-bg); border-top: 1px solid var(--border-color); }
nav ul { padding: 0; margin: 0; list-style: none; display: flex; gap: 0.5rem; }
nav ul li { position: relative; }
nav ul li a { display: flex; align-items: center; gap: 0.5rem; padding: 0.75rem 1rem; border-radius: 6px; color: var(--text-color); text-decoration: none; font-weight: 500; transition: background-color 0.2s, color 0.2s; }
nav ul li a:hover, nav ul li a.active { background-color: var(--primary-color); color: white; }
nav ul li a img { width: 18px; height: 18px; }
nav ul li a:hover img, nav ul li a.active img { filter: brightness(0) invert(1); }
.dropdown-menu { display: none; position: absolute; top: 100%; left: 0; list-style: none; padding: 0.5rem 0; margin-top: 0; background-color: var(--card-bg); border-radius: 6px; box-shadow: var(--shadow); min-width: 200px; z-index: 100; opacity: 0; transform: translateY(-10px); transition: opacity 0.2s ease, transform 0.2s ease; pointer-events: none; }
.dropdown-menu li a { width: 100%; box-sizing: border-box; }
nav ul li.has-dropdown:hover .dropdown-menu { display: block; opacity: 1; transform: translateY(0); pointer-events: auto; }
.container { background-color: var(--card-bg); padding: 2rem; border-radius: 8px; box-shadow: var(--shadow); }
h1,h2,h3 { margin-top: 0; }
EOF
cat << 'EOF' > assets/css/components.css
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
#toast-container { position: fixed; bottom: 20px; right: 20px; z-index: 1050; display: flex; flex-direction: column; gap: 10px; }
.toast { background-color: var(--card-bg); padding: 15px 20px; border-radius: 5px; box-shadow: var(--shadow); opacity: 0; transition: opacity 0.3s, transform 0.3s; transform: translateY(100%); }
.toast.show { opacity: 1; transform: translateY(0); }
.toast.success { border-left: 5px solid var(--success-color); }
.toast.error { border-left: 5px solid var(--error-color); }
.toast.info { border-left: 5px solid var(--primary-color); }
.accordion-button { background-color: var(--background-color); color: var(--text-color); cursor: pointer; padding: 1rem; width: 100%; border: none; border-top: 1px solid var(--border-color); text-align: left; transition: background-color 0.2s; display: flex; justify-content: space-between; align-items: center; }
.accordion-button.active, .accordion-button:hover { background-color: #e9ecef; }
html[data-theme='dark'] .accordion-button.active, html[data-theme='dark'] .accordion-button:hover { background-color: #495057; }
.accordion-button .icon-chevron { transition: transform 0.3s ease; }
.accordion-button.active .icon-chevron { transform: rotate(180deg); }
.accordion-content { padding: 0 1rem; background-color: var(--card-bg); max-height: 0; overflow: hidden; transition: max-height 0.3s ease-out; }
EOF
cat << 'EOF' > assets/css/settings.css
.switch { position: relative; display: inline-block; width: 60px; height: 34px; } .switch input { opacity: 0; width: 0; height: 0; } .slider { position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0; background-color: #ccc; transition: .4s; } .slider:before { position: absolute; content: ""; height: 26px; width: 26px; left: 4px; bottom: 4px; background-color: white; transition: .4s; border-radius: 50%;} input:checked + .slider { background-color: var(--primary-color); } input:checked + .slider:before { transform: translateX(26px); } .slider.round { border-radius: 34px; } .slider.round:before { border-radius: 50%; } .setting-item { display: flex; align-items: center; justify-content: space-between; }
EOF

# --- 5. HTML-DATEIEN ERSTELLEN (MIT UMFANGREICHER BEISPIELSEITE) ---
echo "✅ Erstelle HTML-Dateien..."
HTML_HEAD_TEMPLATE='<!DOCTYPE html><html lang="de"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><link rel="icon" href="assets/icons/favicon.svg" type="image/svg+xml">'
NAV_TEMPLATE='<header><nav><ul><li><a href="index.html" class="{{INDEX_ACTIVE}}"><img src="assets/icons/icon_home.svg" alt="Start"></a></li><li class="has-dropdown"><a href="examples.html" class="{{EXAMPLES_ACTIVE}}"><img src="assets/icons/icon_layers.svg" alt="Beispiele"> <span>Beispiele</span></a><ul class="dropdown-menu"><li><a href="example-subpage.html">Unterseite 1</a></li></ul></li><li><a href="settings.html" class="{{SETTINGS_ACTIVE}}"><img src="assets/icons/icon_settings.svg" alt="Einstellungen"></a></li><li><a href="drag-and-drop.html" class="{{DND_ACTIVE}}"><img src="assets/icons/icon_drag_and_drop.svg" alt="Drag & Drop"></a></li></ul></nav></header>'
FOOTER='<footer><p>&copy; 2025 Dein Name</p></footer>'
SCRIPTS_MAIN='<script src="assets/js/theme.js"></script><script src="assets/js/main.js"></script>'

# index.html
NAV=$(echo "$NAV_TEMPLATE" | sed 's/{{INDEX_ACTIVE}}/active/g' | sed 's/{{[A-Z_]*_ACTIVE}}//g')
echo "$HTML_HEAD_TEMPLATE<title>Startseite</title><link rel=\"stylesheet\" href=\"assets/css/style.css\"></head><body>$NAV<main class=\"container\"><h1>Willkommen beim WebScaffold</h1><p>Dies ist ein modernes Grundgerüst für Frontend-Projekte. Erkunde die <a href='examples.html'>Beispiele</a>, um alle UI-Komponenten zu sehen.</p></main>$FOOTER$SCRIPTS_MAIN</body></html>" > index.html

# examples.html (Komplett überarbeitet)
NAV=$(echo "$NAV_TEMPLATE" | sed 's/{{EXAMPLES_ACTIVE}}/active/g' | sed 's/{{[A-Z_]*_ACTIVE}}//g')
cat << 'EOF' > examples.html
$HTML_HEAD_TEMPLATE
<title>UI-Komponenten</title>
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
$NAV
<main class="container">
    <h1>UI-Komponenten</h1>
    <p>Hier ist eine Übersicht aller verfügbaren UI-Elemente in diesem Template.</p>

    <div class="card">
        <h2>Buttons</h2>
        <p>Standard-Buttons für verschiedene Aktionen.</p>
        <div class="button-group">
            <button class="button">Primär</button>
            <button class="button secondary">Sekundär</button>
            <button class="button danger">Gefahr</button>
        </div>
    </div>

    <div class="card">
        <h2>Modal (Pop-up-Fenster)</h2>
        <p>Ein modales Fenster, das über den Inhalt gelegt wird.</p>
        <div class="button-group">
            <button class="button" id="open-modal-btn">Modal öffnen</button>
        </div>
    </div>

    <div class="card">
        <h2>Toasts (Benachrichtigungen)</h2>
        <p>Kurze, selbst verschwindende Nachrichten am Bildschirmrand.</p>
        <div class="button-group">
            <button class="button" id="toast-success-btn">Erfolgs-Toast</button>
            <button class="button" id="toast-error-btn">Fehler-Toast</button>
            <button class="button" id="toast-info-btn">Info-Toast</button>
        </div>
    </div>

    <div class="card">
        <h2>Akkordeon</h2>
        <p>Auf- und zuklappbare Inhaltsbereiche.</p>
        <div class="accordion-container">
            <button type="button" class="accordion-button">
                <span>Bereich 1</span>
                <img src="assets/icons/icon_chevron_down.svg" alt="" class="icon-chevron">
            </button>
            <div class="accordion-content"><p>Dies ist der Inhalt des ersten Bereichs.</p></div>
            <button type="button" class="accordion-button">
                <span>Bereich 2</span>
                <img src="assets/icons/icon_chevron_down.svg" alt="" class="icon-chevron">
            </button>
            <div class="accordion-content"><p>Dies ist der Inhalt des zweiten Bereichs.</p></div>
        </div>
    </div>
</main>

<div id="demo-modal" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <h3>Modaler Dialog</h3>
            <button class="modal-close-btn" aria-label="Schließen">&times;</button>
        </div>
        <p>Dies ist der Inhalt des Pop-up-Fensters. Du kannst es schließen, indem du auf das X, den Button unten oder außerhalb des Fensters klickst.</p>
        <div class="modal-actions">
            <button class="button secondary modal-close-btn">Schließen</button>
        </div>
    </div>
</div>
<div id="toast-container"></div>
$FOOTER
$SCRIPTS_MAIN
</body>
</html>
EOF
sed -i "s|^\$NAV|$NAV|" examples.html
sed -i "s|^\$FOOTER|$FOOTER|" examples.html
sed -i "s|^\$SCRIPTS_MAIN|$SCRIPTS_MAIN|" examples.html
sed -i "s|^\$HTML_HEAD_TEMPLATE|$HTML_HEAD_TEMPLATE|" examples.html


# drag-and-drop.html (Mit Handle)
NAV=$(echo "$NAV_TEMPLATE" | sed 's/{{DND_ACTIVE}}/active/g' | sed 's/{{[A-Z_]*_ACTIVE}}//g')
DND_SCRIPTS='<script src="assets/js/theme.js"></script><script src="https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js"></script><script>document.addEventListener("DOMContentLoaded",function(){new Sortable(document.getElementById("sortable-list"),{animation:150, handle: ".drag-handle"})});</script>'
echo "$HTML_HEAD_TEMPLATE<title>Drag & Drop</title><link rel=\"stylesheet\" href=\"assets/css/style.css\"><style>#sortable-list{list-style:none;padding:0}#sortable-list li{display:flex;align-items:center;gap:1rem;padding:15px;margin-bottom:10px;background-color:var(--background-color);border:1px solid var(--border-color);border-radius:5px}.drag-handle{cursor:grab}</style></head><body>$NAV<main class=\"container\"><h1>Drag & Drop</h1><p>Verschiebe die Elemente mit dem Handle-Icon.</p><ul id=\"sortable-list\"><li><img src=\"assets/icons/icon_drag_handle.svg\" alt=\"Move\" class=\"drag-handle\"> Element Alpha</li><li><img src=\"assets/icons/icon_drag_handle.svg\" alt=\"Move\" class=\"drag-handle\"> Element Beta</li><li><img src=\"assets/icons/icon_drag_handle.svg\" alt=\"Move\" class=\"drag-handle\"> Element Gamma</li></ul></main>$FOOTER$DND_SCRIPTS</body></html>" > drag-and-drop.html

# ... restliche HTML-Dateien ...
NAV=$(echo "$NAV_TEMPLATE" | sed 's/{{EXAMPLES_ACTIVE}}/active/g' | sed 's/{{[A-Z_]*_ACTIVE}}//g')
echo "$HTML_HEAD_TEMPLATE<title>Unterseite 1</title><link rel=\"stylesheet\" href=\"assets/css/style.css\"></head><body>$NAV<main class=\"container\"><h1>Unterseite 1</h1></main>$FOOTER$SCRIPTS_MAIN</body></html>" > example-subpage.html
NAV=$(echo "$NAV_TEMPLATE" | sed 's/{{SETTINGS_ACTIVE}}/active/g' | sed 's/{{[A-Z_]*_ACTIVE}}//g')
echo "$HTML_HEAD_TEMPLATE<title>Einstellungen</title><link rel=\"stylesheet\" href=\"assets/css/style.css\"><link rel=\"stylesheet\" href=\"assets/css/settings.css\"></head><body>$NAV<main class=\"container\"><h1>Einstellungen</h1><div class=\"card\"><div class=\"setting-item\"><label for=\"theme-toggle\">Dark Mode</label><label class=\"switch\"><input type=\"checkbox\" id=\"theme-toggle\" role=\"switch\"><span class=\"slider round\"></span></label></div></div></main>$FOOTER<script src=\"assets/js/theme.js\"></script></body></html>" > settings.html

echo "---"
echo "🏁 Projekt erfolgreich erstellt. Alle Wünsche wurden umgesetzt."