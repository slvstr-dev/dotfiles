#!/bin/bash

BREWFILE_DIR=~/dotfiles/.config/homebrew/brewfiles

ask_for_action() {
  while true; do
    echo -e "\nChoose your action:\n1. Install\n2. Update\n3. Cleanup\n4. Uninstall"
    read -p "Enter the number of your action (1-4): " action_choice

    case $action_choice in
      1)
        action="install"
        break
        ;;
      2)
        action="update"
        break
        ;;
      3)
        action="cleanup"
        break
        ;;
      4)
        action="uninstall"
        break
        ;;
      *)
        echo "❌ Invalid choice. Please enter 1 for 'Install', 2 for 'Update', 3 for 'Cleanup' or 4 for 'Uninstall'."
        ;;
    esac
  done
}

ask_for_configuration() {
  while true; do
    echo -e "\nChoose your configuration:\n1. Personal\n2. Work"
    read -p "Enter the number for your configuration (1-2): " config_choice

    case $config_choice in
      1)
        config="personal"
        break
        ;;
      2)
        config="work"
        break
        ;;
      *)
        echo "❌ Invalid choice. Please enter 1 for 'Personal' or 2 for 'Work'."
        ;;
    esac
  done
}

ask_for_action

if [ "$action" == "uninstall" ]; then
  echo -e "\nYou have selected to '$action' the Homebrew dependencies.\n"
  ./scripts/${action}.sh

  if [ $? -ne 0 ]; then
    echo -e "❌ Error: '$action' failed to run successfully!" >&2
    exit 1
  fi

  echo "🎉 The '$action' process for the Homebrew dependencies is complete!"
else
  ask_for_configuration

  echo -e "You have selected to '$action' the Homebrew '$config' configuration.\n"
  ./scripts/${action}.sh "$BREWFILE_DIR" "$config"
  
  if [ $? -ne 0 ]; then
    echo -e "❌ Error: '$action' failed to run successfully!" >&2
    exit 1
  fi
  echo "🎉 The '$action' process for the Homebrew '$config' configuration is complete!"
fi
