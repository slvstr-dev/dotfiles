# Ghostty
precmd() { precmd() { echo "" } }

# Homebrew
export HOMEBREW_NO_ENV_HINTS=1

_brewfile() {
  if ! command -v brew &> /dev/null; then
    echo "🍺 Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
      echo "🚫 Failed to install Homebrew" >&2
      return 1
    }
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"
  fi
  brew bundle "${@}" --file="$HOME/Brewfile"
}

_brew_doctor() {
  echo "🩺 Running brew doctor..."
  brew doctor
}

brew:install() {
  echo "📦 Installing Brewfile..."
  _brewfile install && _brew_doctor
  echo "✅ Done!"
}

brew:update() {
  echo "🔄 Updating Brewfile..."
  _brewfile install --upgrade && _brew_doctor
  echo "✅ Done!"
}

brew:cleanup() {
  echo "🧹 Cleaning up Brewfile..."
  _brewfile cleanup --force && brew autoremove && _brew_doctor
  echo "✅ Done!"
}

brew:uninstall() {
  echo "⚠️ This will uninstall ALL brew packages. Continue? (y/N)"
  read -r confirm
  [[ "$confirm" =~ ^[Yy]$ ]] || return 0
  echo "🗑️ Uninstalling..."
  local formulae=($(brew list --formula))
  [[ ${#formulae[@]} -gt 0 ]] && brew uninstall --force "${formulae[@]}"
  local casks=($(brew list --cask))
  [[ ${#casks[@]} -gt 0 ]] && brew uninstall --cask --force "${casks[@]}"
  brew autoremove
  echo "✅ Done!"
}

# Mise
eval "$(mise activate zsh)"

# Starship
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"
