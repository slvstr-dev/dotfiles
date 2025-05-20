#!/bin/bash

uninstall_dependencies() {
  echo -e "\n🧹 Uninstalling all installed Homebrew packages..."

  brew uninstall --force $(brew list) || {
    echo "❌ Error: Failed to uninstall Homebrew dependencies." >&2
    return 1
  }

  echo -e "\n🗑️ Removing unused dependencies..."

  brew autoremove || {
    echo "❌ Error: Failed to remove unused dependencies." >&2
    return 1
  }
}

echo -e "\n🚨 Starting the uninstallation process..."

uninstall_dependencies

echo -e "\n🎉 Uninstallation process completed successfully!"
