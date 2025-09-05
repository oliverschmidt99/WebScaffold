document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".accordion-button").forEach((button) => {
    button.addEventListener("click", () => {
      const content = button.nextElementSibling;
      button.classList.toggle("active");
      content.style.maxHeight = button.classList.contains("active")
        ? content.scrollHeight + "px"
        : null;
    });
  });
});
