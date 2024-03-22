# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

if command -v brew &> /dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  FPATH="${HOME}/.zsh:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Options
unsetopt BEEP

# Settings
export EDITOR="nvim"
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export HISTSIZE=1000000000
export HUSKY=0
export SAVEHIST=$HISTSIZE
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export VISUAL=$EDITOR
export XDG_CONFIG_HOME="$HOME/.config"

# Aliases
alias ls='lsd'

# Plugins
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"
