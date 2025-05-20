#!/bin/bash

BREWFILE_DIR=$HOME/dotfiles/.config/homebrew/brewfiles
DEFAULT_BREW_CONFIG="personal"
ENV_FILE=$HOME/dotfiles/.config/homebrew/.env

ask_for_action() {
  local action_choice

  while true; do
    echo -e "\n👷 Choose your action:\n1. Install\n2. Update\n3. Cleanup\n4. Uninstall"
    echo -n "Enter the number of your action (1-4): "
    read action_choice

    case $action_choice in
      1) action="install"; break ;;
      2) action="update"; break ;;
      3) action="cleanup"; break ;;
      4) action="uninstall"; break ;;
      *) echo "❌ Invalid choice." ;;
    esac
  done
}

confirm_action() {
  while true; do
    echo -n -e "\n⚠️ Are you sure you want to proceed (y/N)? "
    read confirm
    confirm="${confirm:-no}"

    case $confirm in
      [Yy] | yes | YES)
        break
        ;;
      [Nn] | no | NO)
        echo "🚪 Exiting..."
        exit 0
        ;;
      *)
        echo -e "❌ Invalid choice."
        ;;
    esac
  done
}

# Set default configuration
config=$DEFAULT_BREW_CONFIG

# Load the .env file if it exists
if [[ -f "$ENV_FILE" ]]; then
  source "$ENV_FILE"

  if [[ -n "$BREW_CONFIG" ]]; then

    if [[ "$BREW_CONFIG" != "personal" && "$BREW_CONFIG" != "work" ]]; then
      echo "⚠️ Error: Invalid BREW_CONFIG value: $BREW_CONFIG. Must be 'personal' or 'work'."
      echo "Falling back to default configuration: $config"
    else
      config="$BREW_CONFIG"

      echo "ℹ️ Loaded configuration from .env file: $config"
    fi
  else
    echo "ℹ️ No BREW_CONFIG found in .env file, using default: $config"
  fi
else
  echo "ℹ️ No .env file found, using default configuration: $config"
fi

# Execute the action based on user input
ask_for_action

if [[ "$action" == "uninstall" ]]; then
  echo -e "\n🫵 You have selected to '$action' the Homebrew dependencies."

  confirm_action

  ./scripts/${action}.sh

  if (( $? != 0 )); then
    echo -e "❌ Error: '$action' failed to run successfully!" >&2
    exit 1
  fi
else
  echo -e "\n🫵 You have selected to '$action' the Homebrew '$config' configuration."

  confirm_action

  ./scripts/${action}.sh "$BREWFILE_DIR" "$config"

  if (( $? != 0 )); then
    echo -e "❌ Error: '$action' failed to run successfully!" >&2
    exit 1
  fi
fi
