#!/bin/bash
# restore-media-server.sh
# Restore media server config from backup or Git repo

set -e

REPO_URL="git@github.com:timshel13/media-server-config.git"
TARGET_DIR="$HOME/media-server-config"
BACKUP_ARCHIVE=""

echo "🛠️ Restore Script Starting..."

# 1. Ensure Docker is installed
if ! command -v docker &> /dev/null; then
  echo "🐳 Installing Docker..."
  sudo apt update && sudo apt install -y docker.io docker-compose
  sudo systemctl enable docker
  sudo systemctl start docker
else
  echo "✅ Docker already installed"
fi

# 2. Ensure Git is installed
if ! command -v git &> /dev/null; then
  echo "📦 Installing Git..."
  sudo apt update && sudo apt install -y git
else
  echo "✅ Git already installed"
fi

# 3. Clone or pull repo
if [ -d "$TARGET_DIR/.git" ]; then
  echo "📥 Pulling latest from repo..."
  cd "$TARGET_DIR"
  git pull
else
  echo "📦 Cloning repo to $TARGET_DIR..."
  git clone "$REPO_URL" "$TARGET_DIR"
fi

# 4. Offer to restore from latest backup tarball if one exists
cd "$TARGET_DIR"
LATEST_BACKUP=$(find backup-archives -name "full-backup-*.tar.gz" | sort | tail -n 1)
if [ -n "$LATEST_BACKUP" ]; then
  echo "📦 Found backup archive: $LATEST_BACKUP"
  read -rp "Would you like to restore this archive? (y/n): " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    echo "📂 Extracting..."
    tar -xzvf "$LATEST_BACKUP" -C /
    echo "✅ Backup extracted"
  fi
fi

# 5. Ensure media mountpoint exists
if [ ! -d "/mnt/media1tb" ]; then
  echo "❌ /mnt/media1tb not found. Please ensure your media drive is mounted."
  exit 1
fi

# 6. Launch containers
echo "🚀 Launching Docker stack..."
docker compose -f "$TARGET_DIR/media_server_stack.yml" up -d \
  radarr sonarr lidarr readarr \
  prowlarr jackett qbittorrent \
  ntfy adguard gluetun traefik

echo "📦 Initial services deployed."

# 7. Reminder for Jellyfin and Jellyseer
echo "🕒 Jellyfin and Jellyseer are *not* launched by default."
echo "    You can manually start them later with:"
echo "    docker compose -f $TARGET_DIR/media_server_stack.yml up -d jellyfin jellyseer"

echo "✅ Restore complete. Check apps and network access!"
