#!/bin/bash
# For Apple Silicon

set -euo pipefail

# Xcode CLI ========================================
if ! xcode-select -p &>/dev/null; then
  echo "📦 Installing Xcode Command Line Tools..."
  xcode-select --install

  echo "⏳ Waiting for Xcode Command Line Tools installation to complete..."
  echo "   (Please complete the installer dialog if it appears)"
  until xcode-select -p &>/dev/null; do
    sleep 5
  done
  echo "✅ Xcode Command Line Tools installed"
fi

# Homebrew ========================================
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

if ! command -v brew &>/dev/null; then
  echo "❌ brew command not found after installation. Aborting."
  exit 1
fi

# Others ===========================================
brew install chezmoi
chezmoi init --apply unclepomedev
brew bundle --file="$HOME/.local/share/chezmoi/Brewfile"
echo "✅ Done! Restart your shell."
