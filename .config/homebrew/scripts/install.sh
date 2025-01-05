#!/bin/bash

install_homebrew() {
  if ! command -v brew &> /dev/null; then
    echo "🔨 Homebrew not found. Installing Homebrew..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
      echo "❌ Error: Failed to install Homebrew" >&2
      return 1
    }
  else
    echo "✅ Homebrew is already installed."
  fi
}

install_brewfile() {
  local brewfile_dir="$1"
  local config="$2"

  echo "📦 Installing dependencies from Brewfile.$config..."

  brew bundle --file="$brewfile_dir/Brewfile.$config" --verbose || {
    echo "❌ Error: Failed to set up $config configuration" >&2
    return 1
  }
}

brewfile_dir="$1"
config="$2"

echo -e "🚀 Starting installation of Homebrew '$config' configuration..."

install_homebrew
install_brewfile "$brewfile_dir" "$config"

echo -e "✅ Installation of Homebrew '$config' configuration is complete!\n"
