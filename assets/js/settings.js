// assets/js/settings.js

document.addEventListener("DOMContentLoaded", () => {
  const themeToggle = document.getElementById("theme-toggle");

  // Initialen Status des Schalters basierend auf dem gespeicherten Wert setzen
  const currentTheme = localStorage.getItem("theme") || "light";
  if (themeToggle) {
    themeToggle.checked = currentTheme === "dark";
  }

  // Event Listener für den Schalter hinzufügen
  if (themeToggle) {
    themeToggle.addEventListener("change", () => {
      const newTheme = themeToggle.checked ? "dark" : "light";
      // Neue Auswahl im localStorage speichern
      localStorage.setItem("theme", newTheme);
      // Die globale Funktion aus theme.js aufrufen, um das Theme sofort zu ändern
      applyTheme(newTheme);
    });
  }
});
