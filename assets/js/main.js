document.addEventListener("DOMContentLoaded", () => {
  console.log("DOM fully loaded and parsed. main.js is ready!");

  // --- Bestehender Code für den Beispiel-Button ---
  const actionButton = document.getElementById("action-button");
  if (actionButton) {
    actionButton.addEventListener("click", () => {
      alert("Button wurde geklickt!");
    });
  }

  // --- Bestehender Code für die aufklappbaren Bereiche (Akkordeon) ---
  const accordionButtons = document.querySelectorAll(".accordion-button");
  accordionButtons.forEach((button) => {
    button.addEventListener("click", () => {
      button.classList.toggle("active");
      const content = button.nextElementSibling;
      if (button.classList.contains("active")) {
        content.style.maxHeight = content.scrollHeight + "px";
      } else {
        content.style.maxHeight = null;
      }
    });
  });

  // --- Logik für den Navigations-Slider ---
  handleNavSlider();

  // --- Logik für die Kachel-Navigation auf seite4.html ---
  if (document.getElementById("kachel-nav")) {
    initializeCardNavigation("kachel-nav", "kachel-sektionen");
  }

  // --- NEU: Logik für die Tag-Auswahl auf index.html ---
  if (document.getElementById("tags-selection")) {
    initializeTagSelection();
  }
});

function handleNavSlider() {
  const nav = document.getElementById("main-nav");
  if (!nav) return;
  const slider = nav.querySelector(".nav-slider");
  const activeNavItem = nav.querySelector(
    ".nav-item > a.active"
  )?.parentElement;
  if (activeNavItem) {
    setTimeout(() => {
      slider.style.width = `${activeNavItem.offsetWidth}px`;
      slider.style.left = `${activeNavItem.offsetLeft}px`;
    }, 10);
  }
}

function initializeCardNavigation(navId, sectionContainerId) {
  const cards = document.querySelectorAll(`#${navId} .card`);
  const sections = document.querySelectorAll(
    `#${sectionContainerId} .config-section`
  );
  cards.forEach((card) => {
    card.addEventListener("click", () => {
      sections.forEach((s) => s.classList.remove("active"));
      cards.forEach((c) => c.classList.remove("active"));
      const targetId = card.dataset.target;
      const targetElement = document.getElementById(targetId);
      if (targetElement) {
        targetElement.classList.add("active");
      }
      card.classList.add("active");
    });
  });
}

// --- NEUE FUNKTIONEN FÜR TAGS ---

let currentEditingTags = [];

async function initializeTagSelection() {
  await loadTags(); // Lädt die Daten aus tags.json

  document
    .querySelector(".add-tags-btn")
    .addEventListener("click", openTagModal);
  document
    .getElementById("modal-cancel-btn")
    .addEventListener("click", closeTagModal);
  document
    .getElementById("modal-save-btn")
    .addEventListener("click", saveTagsFromModal);
  document
    .getElementById("tag-search-input")
    .addEventListener("input", filterTagsInModal);
}

function openTagModal() {
  renderTagsInModal(currentEditingTags);
  document.getElementById("tag-modal").style.display = "flex";
}

function closeTagModal() {
  document.getElementById("tag-modal").style.display = "none";
  document.getElementById("tag-search-input").value = "";
}

function saveTagsFromModal() {
  updateSelectedTagsDisplay("tags-selection", currentEditingTags);
  closeTagModal();
}

function renderTagsInModal(selectedTags = []) {
  const mainListContainer = document.getElementById("modal-tag-list");
  mainListContainer.innerHTML = "";

  (allTagsData.categories || []).forEach((category) => {
    let categoryHtml = `<div class="tag-group"><strong>${category.name}</strong>`;
    (category.tags || []).forEach((tag) => {
      categoryHtml += getTagBadge(tag.name);
    });
    categoryHtml += "</div>";
    mainListContainer.innerHTML += categoryHtml;
  });

  updateSelectedTagsDisplay("modal-selected-tags", selectedTags);

  mainListContainer.querySelectorAll(".tag-badge").forEach((badge) => {
    const tagName = badge.textContent.trim();
    if (selectedTags.includes(tagName)) {
      badge.classList.add("selected");
    }

    badge.addEventListener("click", () => {
      badge.classList.toggle("selected");
      if (currentEditingTags.includes(tagName)) {
        currentEditingTags = currentEditingTags.filter((t) => t !== tagName);
      } else {
        currentEditingTags.push(tagName);
      }
      updateSelectedTagsDisplay("modal-selected-tags", currentEditingTags);
    });
  });
}

function updateSelectedTagsDisplay(containerId, tags) {
  const container = document.getElementById(containerId);
  container.innerHTML = "";
  tags.forEach((tag) => {
    container.innerHTML += getTagBadge(tag);
  });

  if (containerId === "tags-selection") {
    container.innerHTML +=
      '<button type="button" class="add-tags-btn">+ Tags ändern</button>';
    container
      .querySelector(".add-tags-btn")
      .addEventListener("click", openTagModal);
  }
}

function filterTagsInModal() {
  const filter = document
    .getElementById("tag-search-input")
    .value.toLowerCase();
  document.querySelectorAll("#modal-tag-list .tag-badge").forEach((badge) => {
    badge.style.display = badge.textContent.toLowerCase().includes(filter)
      ? "inline-flex"
      : "none";
  });
}
