#!/bin/zsh

BREWFILE_DIR=~/dotfiles/.config/homebrew/brewfiles

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

ask_for_configuration() {
  local config_choice

  while true; do
    echo -e "\n⚙️ Choose your configuration:\n1. Personal\n2. Work"
    echo -n "Enter the number for your configuration (1-2): "
    read config_choice

    case $config_choice in
      1) config="personal"; break ;;
      2) config="work"; break ;;
      *) echo "❌ Invalid choice." ;;
    esac
  done
}

confirm_action() {
  while true; do
    echo -n -e "\n⚠️ Are you sure you want to proceed (Y/n)? "
    read confirm
    confirm="${confirm:-yes}"

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
  ask_for_configuration
  echo -e "\n🫵 You have selected to '$action' the Homebrew '$config' configuration."

  confirm_action

  ./scripts/${action}.sh "$BREWFILE_DIR" "$config"

  if (( $? != 0 )); then
    echo -e "❌ Error: '$action' failed to run successfully!" >&2
    exit 1
  fi
fi
