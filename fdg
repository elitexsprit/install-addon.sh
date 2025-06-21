#!/bin/bash
RAR_URL="https://filebin.net/w68ztc08d922m92l/Blueprints.rar"
RAR_FILE="/tmp/Blueprints.rar"
DEST_DIR="/var/www/pterodactyl"

echo "📦 Downloading addon archive..."
curl -L "$RAR_URL" -o "$RAR_FILE"

echo "🔧 Installing 'unrar' if missing..."
command -v unrar >/dev/null 2>&1 || { sudo apt update && sudo apt install unrar -y; }

echo "📂 Extracting .rar to $DEST_DIR..."
sudo mkdir -p "$DEST_DIR"
sudo unrar x -o+ "$RAR_FILE" "$DEST_DIR"

echo "🔐 Fixing permissions..."
sudo chown -R www-data:www-data "$DEST_DIR"
sudo chmod -R 755 "$DEST_DIR"

echo "🛠 Running blueprint installer..."
cd "$DEST_DIR"
sudo blueprint -install *.blueprint

echo "✅ Done: Addons installed and blueprint files applied!"
