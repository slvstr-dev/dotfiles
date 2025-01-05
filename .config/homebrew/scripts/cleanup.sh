#!/bin/bash

cleanup_brewfile() {
  local brewfile_dir="$1"
  local config="$2"

  echo "🧹 Cleaning up dependencies from Brewfile.$config..."

  brew bundle --file="$brewfile_dir/Brewfile.$config" --force cleanup || {
    echo "❌ Error: Failed to clean up dependencies from Brewfile.$config" >&2
    return 1
  }
}

brewfile_dir="$1"
config="$2"

echo "🔍 Starting the cleanup process for Homebrew dependencies..."

cleanup_brewfile "$brewfile_dir" "$config"

echo -e "✅ Cleanup process for Homebrew configuration '$config' completed successfully!\n"