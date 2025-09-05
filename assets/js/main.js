document.addEventListener("DOMContentLoaded", () => {
  // --- Akkordeon-Logik ---
  document.querySelectorAll(".accordion-button").forEach((button) => {
    button.addEventListener("click", () => {
      const content = button.nextElementSibling;
      button.classList.toggle("active");
      content.style.maxHeight = button.classList.contains("active")
        ? content.scrollHeight + "px"
        : null;
    });
  });

  // Die JavaScript-Logik für das Dropdown-Menü wurde entfernt.
  // Das Menü wird jetzt rein über CSS gesteuert (:hover).
});
