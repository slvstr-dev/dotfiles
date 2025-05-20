#!/bin/bash

cleanup_brewfile() {
  local brewfile_dir="$1"
  local config="$2"

  echo -e "\n🧹 Cleaning up dependencies..."

  brew bundle --file="$brewfile_dir/Brewfile.$config" --force cleanup || {
    echo "❌ Error: Failed to clean up dependencies from Brewfile.$config" >&2
    return 1
  }
}

brewfile_dir="$1"
config="$2"

echo -e "\n🔍 Starting the cleanup process..."

cleanup_brewfile "$brewfile_dir" "$config"

echo -e "\n🎉 Cleanup process completed successfully!"
