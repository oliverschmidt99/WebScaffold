document.addEventListener("DOMContentLoaded", () => {
  console.log("DOM fully loaded and parsed. main.js is ready!");

  // --- Bestehender Code für den Beispiel-Button ---
  const actionButton = document.getElementById("action-button");
  if (actionButton) {
    actionButton.addEventListener("click", () => {
      alert("Button wurde geklickt!");
    });
  }

  // --- KORRIGIERTE Logik für die aufklappbaren Bereiche (Akkordeon) ---
  const accordionButtons = document.querySelectorAll(".accordion-button");

  accordionButtons.forEach((button) => {
    button.addEventListener("click", () => {
      // Zuerst den 'active'-Status des Buttons umschalten
      button.classList.toggle("active");

      // Den zugehörigen Inhaltsbereich finden
      const content = button.nextElementSibling;

      // Prüfen, ob der Button jetzt 'active' ist und die Höhe entsprechend anpassen
      if (button.classList.contains("active")) {
        // Wenn der Button aktiv ist, den Inhalt auf seine volle Höhe ausfahren
        content.style.maxHeight = content.scrollHeight + "px";
      } else {
        // Wenn der Button nicht mehr aktiv ist, den Inhalt wieder einklappen
        content.style.maxHeight = null;
      }
    });
  });
});
