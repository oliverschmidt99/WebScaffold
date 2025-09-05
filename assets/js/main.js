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
