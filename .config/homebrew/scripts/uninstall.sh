#!/bin/bash

uninstall_dependencies() {
  echo "🧹 Uninstalling all currently installed Homebrew packages..."

  brew uninstall --force $(brew list) || {
    echo "❌ Error: Failed to uninstall Homebrew dependencies." >&2
    return 1
  }

  echo "🗑️ Removing unused dependencies..."

  brew autoremove || {
    echo "❌ Error: Failed to remove unused dependencies." >&2
    return 1
  }
}

echo "🚨 Starting the uninstallation process for Homebrew configuration..."

uninstall_dependencies

echo -e "✅ Uninstallation process completed successfully!\n"