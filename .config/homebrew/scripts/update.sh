#!/bin/bash

update_brewfile() {
  local brewfile_dir="$1"
  local config="$2"

  echo -e "\n🔄 Updating configuration..."
  
  brew bundle --file="$brewfile_dir/Brewfile.$config" --verbose || {
    echo "❌ Error: Failed to update $config configuration" >&2
    return 1
  }
}

check_homebrew_health() {
  echo -e "\n🩺 Running brew doctor..."

  brew doctor --verbose || {
    echo "❗ Warning: Issues detected by brew doctor" >&2
    return 1
  }
}

brewfile_dir="$1"
config="$2"

echo -e "\n🛠️ Starting the update process..."

update_brewfile "$brewfile_dir" "$config"
check_homebrew_health

echo -e "\n🎉 Update process completed successfully!"
