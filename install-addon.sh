#!/bin/bash

# === CONFIG ===
ZIP_URL="https://github.com/elitexsprit/install-addon.sh/releases/download/blueprint-release/Blueprints.zip"
ZIP_FILE="/tmp/Blueprints.zip"
DEST_DIR="/var/www/pterodactyl"

echo "📦 Downloading addon archive..."
curl -L "$ZIP_URL" -o "$ZIP_FILE"

echo "🔧 Installing 'unzip' if missing..."
command -v unzip >/dev/null 2>&1 || { sudo apt update && sudo apt install unzip -y; }

echo "📂 Extracting .zip to $DEST_DIR..."
sudo mkdir -p "$DEST_DIR"
sudo unzip -o "$ZIP_FILE" -d "$DEST_DIR"

echo "🔐 Fixing permissions..."
sudo chown -R www-data:www-data "$DEST_DIR"
sudo chmod -R 755 "$DEST_DIR"

echo "🛠 Running blueprint installer..."
cd "$DEST_DIR"
sudo blueprint -install *.blueprint

echo "✅ Done: Addons installed and blueprint files applied!"
