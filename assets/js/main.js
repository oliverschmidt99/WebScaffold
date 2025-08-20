document.addEventListener("DOMContentLoaded", () => {
  console.log("DOM fully loaded and parsed. main.js is ready!");

  // Hier kannst du deinen projektspezifischen JavaScript-Code hinzufügen.

  const actionButton = document.getElementById("action-button");

  if (actionButton) {
    actionButton.addEventListener("click", () => {
      alert("Button wurde geklickt!");
    });
  }
});
