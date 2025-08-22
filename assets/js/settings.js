document.addEventListener("DOMContentLoaded", () => {
  if (document.getElementById("categories-container")) {
    initializeSettings();
  }
});

let currentTagsData = {};
const pastelColors = [
  "#FFADAD",
  "#FFD6A5",
  "#FDFFB6",
  "#CAFFBF",
  "#9BF6FF",
  "#A0C4FF",
  "#BDB2FF",
  "#FFC6FF",
];

async function initializeSettings() {
  await loadTags(); // Lädt von der API
  currentTagsData = JSON.parse(JSON.stringify(allTagsData));
  renderCategories();

  document
    .getElementById("add-category-form")
    .addEventListener("submit", handleAddCategory);

  document
    .getElementById("edit-tag-form")
    .addEventListener("submit", handleSaveTag);
  document
    .getElementById("edit-tag-modal-cancel")
    .addEventListener("click", () => closeModal("edit-tag-modal"));

  document
    .getElementById("edit-category-form")
    .addEventListener("submit", handleSaveCategory);
  document
    .getElementById("edit-category-modal-cancel")
    .addEventListener("click", () => closeModal("edit-category-modal"));
}

function openModal(modalId) {
  document.getElementById(modalId).style.display = "flex";
}
function closeModal(modalId) {
  document.getElementById(modalId).style.display = "none";
}

async function saveAllTags() {
  try {
    const response = await fetch("/api/tags", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(currentTagsData),
    });
    const result = await response.json();
    if (!response.ok) throw new Error(result.error || "Fehler beim Speichern");

    await loadTags();
    currentTagsData = JSON.parse(JSON.stringify(allTagsData));
    renderCategories();
  } catch (error) {
    console.error("Fehler beim Speichern der Tags:", error);
    alert("Speichern fehlgeschlagen: " + error.message);
  }
}

function renderCategories() {
  const container = document.getElementById("categories-container");
  container.innerHTML = "";

  if (!currentTagsData.categories || currentTagsData.categories.length === 0) {
    container.innerHTML = "<p>Noch keine Kategorien erstellt.</p>";
    return;
  }

  currentTagsData.categories.forEach((category) => {
    const categoryElement = document.createElement("div");
    categoryElement.className = "category-card";

    let tagsHtml = (category.tags || [])
      .map(
        (tag) => `
        <span class="tag-badge" style="background-color: ${
          tag.color
        }; color: ${getTextColor(tag.color)};">
            ${tag.name}
            <span class="tag-actions">
                <button class="edit-tag-btn" data-category="${
                  category.name
                }" data-tag="${tag.name}">✎</button>
                <button class="delete-tag-btn" data-category="${
                  category.name
                }" data-tag="${tag.name}">×</button>
            </span>
        </span>`
      )
      .join("");

    let colorPaletteHtml = pastelColors
      .map(
        (color, colorIndex) => `
        <div class="color-swatch ${
          colorIndex === 0 ? "selected" : ""
        }" style="background-color: ${color};" data-color="${color}"></div>
    `
      )
      .join("");

    categoryElement.innerHTML = `
        <div class="category-header">
            <h3>${category.name}</h3>
            <div class="actions">
                <button class="edit-category-btn" data-category="${category.name}">✎</button>
                <button class="delete-category-btn" data-category="${category.name}">×</button>
            </div>
        </div>
        <div class="tags-list">${tagsHtml}</div>
        <form class="add-tag-form" data-category="${category.name}">
            <input type="text" placeholder="Neuer Tag-Name..." required>
            <div class="color-palette">${colorPaletteHtml}</div>
            <button type="submit">+ Tag</button>
        </form>`;
    container.appendChild(categoryElement);
  });
  addEventListenersToCategories();
}

function addEventListenersToCategories() {
  document
    .querySelectorAll(".delete-category-btn")
    .forEach((btn) => btn.addEventListener("click", handleDeleteCategory));
  document
    .querySelectorAll(".edit-category-btn")
    .forEach((btn) => btn.addEventListener("click", handleEditCategory));
  document
    .querySelectorAll(".add-tag-form")
    .forEach((form) => form.addEventListener("submit", handleAddTag));
  document
    .querySelectorAll(".edit-tag-btn")
    .forEach((btn) => btn.addEventListener("click", handleEditTag));
  document
    .querySelectorAll(".delete-tag-btn")
    .forEach((btn) => btn.addEventListener("click", handleDeleteTag));

  document.querySelectorAll(".color-palette").forEach((palette) => {
    palette.addEventListener("click", (e) => {
      if (e.target.classList.contains("color-swatch")) {
        palette.querySelector(".selected")?.classList.remove("selected");
        e.target.classList.add("selected");
      }
    });
  });
}

function handleAddCategory(event) {
  event.preventDefault();
  const input = document.getElementById("new-category-name");
  const newCategoryName = input.value.trim();
  if (
    newCategoryName &&
    !currentTagsData.categories.find((c) => c.name === newCategoryName)
  ) {
    currentTagsData.categories.push({ name: newCategoryName, tags: [] });
    saveAllTags();
    input.value = "";
  } else {
    alert("Kategoriename ist ungültig oder existiert bereits.");
  }
}

function handleDeleteCategory(event) {
  const categoryName = event.target.closest("button").dataset.category;
  if (
    confirm(`Soll die Kategorie "${categoryName}" wirklich gelöscht werden?`)
  ) {
    currentTagsData.categories = currentTagsData.categories.filter(
      (c) => c.name !== categoryName
    );
    saveAllTags();
  }
}

function handleEditCategory(event) {
  const categoryName = event.target.closest("button").dataset.category;
  document.getElementById("edit-category-original-name").value = categoryName;
  document.getElementById("edit-category-name").value = categoryName;
  openModal("edit-category-modal");
}

function handleSaveCategory(event) {
  event.preventDefault();
  const originalName = document.getElementById(
    "edit-category-original-name"
  ).value;
  const newName = document.getElementById("edit-category-name").value.trim();
  const category = currentTagsData.categories.find(
    (c) => c.name === originalName
  );

  if (newName && category) {
    if (
      newName !== originalName &&
      currentTagsData.categories.some((c) => c.name === newName)
    ) {
      alert("Dieser Kategoriename existiert bereits.");
      return;
    }
    category.name = newName;
    saveAllTags();
    closeModal("edit-category-modal");
  }
}

function handleAddTag(event) {
  event.preventDefault();
  const form = event.target;
  const categoryName = form.dataset.category;
  const input = form.querySelector("input");
  const tagName = input.value.trim();
  const selectedColor = form.querySelector(".color-swatch.selected").dataset
    .color;
  const category = currentTagsData.categories.find(
    (c) => c.name === categoryName
  );

  if (tagName && category && !category.tags.find((t) => t.name === tagName)) {
    category.tags.push({ name: tagName, color: selectedColor });
    saveAllTags();
    input.value = "";
  } else {
    alert("Tag-Name ist ungültig oder existiert bereits in dieser Kategorie.");
  }
}

function handleEditTag(event) {
  const button = event.target.closest("button");
  const categoryName = button.dataset.category;
  const tagName = button.dataset.tag;
  const category = currentTagsData.categories.find(
    (c) => c.name === categoryName
  );
  const tag = category ? category.tags.find((t) => t.name === tagName) : null;

  if (tag) {
    document.getElementById("edit-tag-original-name").value = tag.name;
    document.getElementById("edit-tag-category-name").value = categoryName;
    document.getElementById("edit-tag-name").value = tag.name;

    const palette = document.getElementById("edit-tag-color-palette");
    palette.innerHTML = pastelColors
      .map(
        (color) => `
        <div class="color-swatch ${
          color === tag.color ? "selected" : ""
        }" style="background-color: ${color};" data-color="${color}"></div>
    `
      )
      .join("");
    openModal("edit-tag-modal");
  }
}

function handleSaveTag(event) {
  event.preventDefault();
  const originalName = document.getElementById("edit-tag-original-name").value;
  const categoryName = document.getElementById("edit-tag-category-name").value;
  const newName = document.getElementById("edit-tag-name").value.trim();
  const selectedColor = document.querySelector(
    "#edit-tag-color-palette .selected"
  ).dataset.color;
  const category = currentTagsData.categories.find(
    (c) => c.name === categoryName
  );
  const tagIndex = category
    ? category.tags.findIndex((t) => t.name === originalName)
    : -1;

  if (tagIndex > -1) {
    if (
      newName !== originalName &&
      category.tags.some((t) => t.name === newName)
    ) {
      alert("Dieser Tag-Name existiert bereits in der Kategorie.");
      return;
    }
    category.tags[tagIndex] = { name: newName, color: selectedColor };
    saveAllTags();
    closeModal("edit-tag-modal");
  }
}

function handleDeleteTag(event) {
  const button = event.target.closest("button");
  const categoryName = button.dataset.category;
  const tagName = button.dataset.tag;
  if (confirm(`Soll der Tag "${tagName}" wirklich gelöscht werden?`)) {
    const category = currentTagsData.categories.find(
      (c) => c.name === categoryName
    );
    if (category) {
      category.tags = category.tags.filter((t) => t.name !== tagName);
      saveAllTags();
    }
  }
}
