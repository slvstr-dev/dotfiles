# Homebrew Configurations
# -----------------------

export PATH="/opt/homebrew/bin:$PATH"

if command -v brew &> /dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    FPATH="${HOME}/.zsh:${FPATH}"

    autoload -Uz compinit
    compinit
fi


# Development Configurations
# --------------------------

## Mise
eval "$(mise activate zsh)"

## PNPM
export PNPM_HOME="/Users/sylvesterhofstra/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"


# Zsh Configurations
# -------------------

## Options and Settings
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef
zle_highlight=('paste:none')
unsetopt BEEP

## Completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

## Colors
autoload -Uz colors && colors

## Useful Functions and Aliases
source "$ZDOTDIR/zsh-functions"
source "$ZDOTDIR/zsh-aliases"

## Files to Source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-prompt"

## Zsh Plugins and Completions
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_completion "esc/conda-zsh-completion" false
