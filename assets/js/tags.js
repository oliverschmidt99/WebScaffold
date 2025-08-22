let allTagsData = {};

async function loadTags() {
  try {
    // Stellt sicher, dass der Browser die Datei nicht aus dem Cache lädt
    const response = await fetch("tags.json?v=" + new Date().getTime());
    if (!response.ok) {
      throw new Error("Netzwerk-Antwort war nicht ok.");
    }
    allTagsData = await response.json();
  } catch (error) {
    console.error("Fehler beim Laden der Tags:", error);
    // Fallback, falls die Datei nicht geladen werden kann
    allTagsData = { categories: [] };
  }
}

function getTagBadge(tagName) {
  let tagInfo = null;
  if (allTagsData.categories) {
    for (const category of allTagsData.categories) {
      const foundTag = category.tags.find((t) => t.name === tagName);
      if (foundTag) {
        tagInfo = foundTag;
        break;
      }
    }
  }

  if (tagInfo) {
    const textColor = getTextColor(tagInfo.color);
    return `<span class="tag-badge" style="background-color: ${tagInfo.color}; color: ${textColor};">${tagName}</span>`;
  }

  return `<span class="tag-badge" style="background-color: #e9ecef; color: #495057;">${tagName}</span>`;
}

function getTextColor(hexcolor) {
  if (!hexcolor) return "#000000";
  const r = parseInt(hexcolor.substr(1, 2), 16);
  const g = parseInt(hexcolor.substr(3, 2), 16);
  const b = parseInt(hexcolor.substr(5, 2), 16);
  const yiq = (r * 299 + g * 587 + b * 114) / 1000;
  return yiq >= 128 ? "#343a40" : "#FFFFFF";
}
