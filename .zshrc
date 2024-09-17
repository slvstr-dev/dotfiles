# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

if command -v brew &> /dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  FPATH="${HOME}/.zsh:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Docker
if which ruby >/dev/null && which gem >/dev/null; then
  export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# pnpm
export PNPM_HOME="/Users/sylvester.hofstra/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Options
unsetopt BEEP

# Settings
export EDITOR="nvim"
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export HISTSIZE=1000000000
export HUSKY=0
export SAVEHIST=$HISTSIZE
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export VISUAL=$EDITOR
export XDG_CONFIG_HOME="$HOME/.config"

# Aliases
alias ls='lsd'

# Add new line between prompts
precmd() { precmd() { echo "" } }

# Plugins
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"
