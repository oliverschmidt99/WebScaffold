document.addEventListener("DOMContentLoaded", () => {
  // Theme anwenden, das im Head-Skript gesetzt wurde
  const theme = document.documentElement.getAttribute("data-theme");
  applyTheme(theme);

  handleNavSlider();

  if (document.getElementById("action-button")) {
    document.getElementById("action-button").addEventListener("click", () => {
      alert("Button wurde geklickt!");
    });
  }

  document.querySelectorAll(".accordion-button").forEach((button) => {
    button.addEventListener("click", () => {
      button.classList.toggle("active");
      const content = button.nextElementSibling;
      content.style.maxHeight = content.style.maxHeight
        ? null
        : content.scrollHeight + "px";
    });
  });

  if (document.getElementById("kachel-nav")) {
    initializeCardNavigation("kachel-nav", "kachel-sektionen");
  }

  if (document.getElementById("tags-selection")) {
    initializeTagSelection();
  }
});

function applyTheme(theme) {
  document.documentElement.setAttribute("data-theme", theme);
  localStorage.setItem("theme", theme);
}

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
      const targetElement = document.getElementById(card.dataset.target);
      if (targetElement) targetElement.classList.add("active");
      card.classList.add("active");
    });
  });
}

// --- TAG SELECTION LOGIC (for index.html) ---
let currentSelectedTags = [];

async function initializeTagSelection() {
  await loadTags();

  const container = document.getElementById("tags-selection");
  container.addEventListener("click", (e) => {
    if (e.target.classList.contains("add-tags-btn")) {
      openTagModal();
    }
    if (e.target.classList.contains("remove-tag")) {
      const tagName = e.target.parentElement.dataset.tag;
      currentSelectedTags = currentSelectedTags.filter((t) => t !== tagName);
      updateSelectedTagsDisplay("tags-selection", currentSelectedTags);
    }
  });

  document
    .getElementById("modal-cancel-btn")
    .addEventListener("click", closeTagModal);
  document
    .getElementById("modal-save-btn")
    .addEventListener("click", saveTagsFromModal);
  document
    .getElementById("tag-search-input")
    .addEventListener("input", filterTagsInModal);

  updateSelectedTagsDisplay("tags-selection", []);
}

function openTagModal() {
  renderTagsInModal(currentSelectedTags);
  document.getElementById("tag-modal").style.display = "flex";
}

function closeTagModal() {
  document.getElementById("tag-modal").style.display = "none";
  document.getElementById("tag-search-input").value = "";
}

function saveTagsFromModal() {
  updateSelectedTagsDisplay("tags-selection", currentSelectedTags);
  closeTagModal();
}

function renderTagsInModal(selectedTags = []) {
  const mainListContainer = document.getElementById("modal-tag-list");
  mainListContainer.innerHTML = "";

  (allTagsData.categories || []).forEach((category) => {
    let tagsHtml = (category.tags || [])
      .map((tag) => getTagBadge(tag.name))
      .join("");
    if (tagsHtml) {
      mainListContainer.innerHTML += `<div class="tag-group"><strong>${category.name}</strong><div>${tagsHtml}</div></div>`;
    }
  });

  updateSelectedTagsDisplay("modal-selected-tags", selectedTags);

  mainListContainer.querySelectorAll(".tag-badge").forEach((badge) => {
    const tagName = badge.dataset.tag;
    if (selectedTags.includes(tagName)) {
      badge.classList.add("selected");
    }

    badge.addEventListener("click", () => {
      badge.classList.toggle("selected");
      if (currentSelectedTags.includes(tagName)) {
        currentSelectedTags = currentSelectedTags.filter((t) => t !== tagName);
      } else {
        currentSelectedTags.push(tagName);
      }
      updateSelectedTagsDisplay("modal-selected-tags", currentSelectedTags);
    });
  });
}

function updateSelectedTagsDisplay(containerId, tags) {
  const container = document.getElementById(containerId);
  let buttonText = tags.length > 0 ? "+ Tags ändern" : "+ Tags hinzufügen";

  container.innerHTML = "";
  tags.forEach((tag) => {
    container.innerHTML += getTagBadge(tag, containerId === "tags-selection");
  });

  if (containerId === "tags-selection") {
    container.innerHTML += `<button type="button" class="add-tags-btn">${buttonText}</button>`;
  }
}

function filterTagsInModal() {
  const filter = document
    .getElementById("tag-search-input")
    .value.toLowerCase();
  document.querySelectorAll("#modal-tag-list .tag-badge").forEach((badge) => {
    badge.style.display = badge.dataset.tag.toLowerCase().includes(filter)
      ? "inline-flex"
      : "none";
  });
}
