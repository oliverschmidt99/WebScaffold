import json
import os
from flask import Flask, render_template, request, jsonify, send_from_directory

app = Flask(__name__, static_folder="assets")

# Pfad zur Tag-Datei
TAGS_FILE = "tags.json"

# --- Hilfsfunktionen ---


def load_tags_data():
    """Lädt die Tag-Daten aus der tags.json."""
    try:
        with open(TAGS_FILE, "r", encoding="utf-8") as f:
            return json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        return {"categories": []}


def save_tags_data(data):
    """Speichert die Tag-Daten in die tags.json."""
    with open(TAGS_FILE, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4)


# --- Routen für die HTML-Seiten ---


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/content")
def content_page():
    return render_template("content_page.html")


@app.route("/faq")
def faq_page():
    return render_template("faq_page.html")


@app.route("/tabs")
def tabs_page():
    return render_template("tabs_page.html")


@app.route("/settings")
def settings():
    return render_template("settings.html")


# --- API für die Tag-Verwaltung ---


@app.route("/api/tags", methods=["GET"])
def get_tags():
    """Gibt die komplette Tag-Struktur zurück."""
    return jsonify(load_tags_data())


@app.route("/api/tags", methods=["POST"])
def update_tags():
    """Nimmt neue Tag-Daten entgegen und speichert sie."""
    try:
        data = request.json
        save_tags_data(data)
        return jsonify({"message": "Tags erfolgreich aktualisiert."})
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# --- Start des Servers ---

if __name__ == "__main__":
    app.run(debug=True, port=5001)
