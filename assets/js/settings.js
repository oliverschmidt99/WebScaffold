document.addEventListener("DOMContentLoaded", () => {
  // Nur ausführen, wenn wir auf der Einstellungsseite sind
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
  await loadTags();
  currentTagsData = JSON.parse(JSON.stringify(allTagsData)); // Tiefe Kopie
  renderCategories();

  document
    .getElementById("add-category-form")
    .addEventListener("submit", handleAddCategory);
  document
    .getElementById("edit-tag-form")
    .addEventListener("submit", handleSaveTag);
  document
    .getElementById("edit-tag-modal-cancel")
    .addEventListener("click", () => {
      document.getElementById("edit-tag-modal").style.display = "none";
    });
}

async function saveAllTags() {
  try {
    // Diese Funktion würde normalerweise die Daten an einen Server senden.
    // Für dieses reine Frontend-Beispiel simulieren wir das nur.
    console.log(
      "Speichere Daten (simuliert):",
      JSON.stringify(currentTagsData, null, 2)
    );
    alert(
      "Diese Aktion ist in diesem reinen Frontend-Template nur simuliert.\nIn einer echten Anwendung würden die Daten jetzt an einen Server gesendet und die 'tags.json' aktualisiert."
    );

    // Um die Änderungen client-seitig sofort sichtbar zu machen:
    allTagsData = JSON.parse(JSON.stringify(currentTagsData));
    renderCategories(); // Neu rendern
  } catch (error) {
    console.error("Fehler beim Speichern der Tags:", error);
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

    categoryElement.innerHTML = `
        <div class="category-header">
            <h3>${category.name}</h3>
            <button class="delete-category-btn danger" data-category="${category.name}">Kategorie löschen</button>
        </div>
        <div class="tags-list">${tagsHtml}</div>
        <form class="add-tag-form" data-category="${category.name}">
            <input type="text" placeholder="Neuer Tag-Name..." required>
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
    .querySelectorAll(".add-tag-form")
    .forEach((form) => form.addEventListener("submit", handleAddTag));
  document
    .querySelectorAll(".edit-tag-btn")
    .forEach((btn) => btn.addEventListener("click", handleEditTag));
  document
    .querySelectorAll(".delete-tag-btn")
    .forEach((btn) => btn.addEventListener("click", handleDeleteTag));
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
  const categoryName = event.target.dataset.category;
  if (
    confirm(`Soll die Kategorie "${categoryName}" wirklich gelöscht werden?`)
  ) {
    currentTagsData.categories = currentTagsData.categories.filter(
      (c) => c.name !== categoryName
    );
    saveAllTags();
  }
}

function handleAddTag(event) {
  event.preventDefault();
  const categoryName = event.target.dataset.category;
  const input = event.target.querySelector("input");
  const tagName = input.value.trim();
  const category = currentTagsData.categories.find(
    (c) => c.name === categoryName
  );
  if (tagName && category && !category.tags.find((t) => t.name === tagName)) {
    const colorIndex = (category.tags.length || 0) % pastelColors.length;
    category.tags.push({ name: tagName, color: pastelColors[colorIndex] });
    saveAllTags();
    input.value = "";
  } else {
    alert("Tag-Name ist ungültig oder existiert bereits in dieser Kategorie.");
  }
}

function handleEditTag(event) {
  const categoryName = event.target.dataset.category;
  const tagName = event.target.dataset.tag;
  const category = currentTagsData.categories.find(
    (c) => c.name === categoryName
  );
  const tag = category ? category.tags.find((t) => t.name === tagName) : null;

  if (tag) {
    document.getElementById("edit-tag-original-name").value = tag.name;
    document.getElementById("edit-tag-category-name").value = categoryName;
    document.getElementById("edit-tag-name").value = tag.name;

    const palette = document.getElementById("edit-tag-color-palette");
    palette.innerHTML = "";
    pastelColors.forEach((color) => {
      const swatch = document.createElement("div");
      swatch.className = "color-swatch";
      swatch.style.backgroundColor = color;
      swatch.dataset.color = color;
      if (color === tag.color) {
        swatch.classList.add("selected");
      }
      swatch.addEventListener("click", () => {
        palette.querySelector(".selected")?.classList.remove("selected");
        swatch.classList.add("selected");
      });
      palette.appendChild(swatch);
    });
    document.getElementById("edit-tag-modal").style.display = "flex";
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
    category.tags[tagIndex] = { name: newName, color: selectedColor };
    saveAllTags();
    document.getElementById("edit-tag-modal").style.display = "none";
  }
}

function handleDeleteTag(event) {
  const categoryName = event.target.dataset.category;
  const tagName = event.target.dataset.tag;
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
