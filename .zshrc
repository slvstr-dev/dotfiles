# Homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Add Homebrew and custom paths to FPATH once
if command -v brew &> /dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Add local zsh functions directory
FPATH="${HOME}/.zsh:${FPATH}"

# Initialize completion system only once
autoload -Uz compinit
compinit

# Ruby
if which ruby >/dev/null && which gem >/dev/null; then
  export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# PNPM
export PNPM_HOME="/Users/sylvester.hofstra/Library/pnpm"
if [[ ":$PATH:" != *":$PNPM_HOME:"* ]]; then
  export PATH="$PNPM_HOME:$PATH"
fi

# Aliases
alias ls='lsd'

# Options
unsetopt BEEP
touch ~/.hushlogin

# Settings
export EDITOR="nvim"
export GPG_TTY=$(tty)
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export HISTSIZE=1000000000
export HUSKY=0
export SAVEHIST=$HISTSIZE
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export VISUAL=$EDITOR
export XDG_CONFIG_HOME="$HOME/.config"

# Add new line between prompts
precmd() { precmd() { echo "" } }

# Plugins
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"

# Source local zsh files
for file in "$HOME/.config/zsh/.zshrc."*(N); do
  if [[ -f "$file" ]]; then
    source "$file"
  fi
done

# -- This code ensures SSH agent is running
if [ -z "$SSH_AUTH_SOCK" ] || [ ! -S "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)"
fi
ssh-add -l > /dev/null || ssh-add
