// assets/js/theme.js

/**
 * Wendet das gespeicherte oder bevorzugte Theme an.
 * @param {string} theme - Das zu setzende Theme ('dark' oder 'light').
 */
function applyTheme(theme) {
  // Setzt das 'data-theme'-Attribut auf dem Wurzelelement (<html>)
  document.documentElement.setAttribute("data-theme", theme);
}

// Stellt sicher, dass das Theme direkt beim Laden der Seite angewendet wird,
// um ein Flackern zu vermeiden.
const savedTheme = localStorage.getItem("theme") || "light";
applyTheme(savedTheme);
