# homebrew
export PATH="/opt/homebrew/bin:$PATH"

if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    FPATH="${HOME}/.zsh:${FPATH}"

    autoload -Uz compinit
    compinit
fi

# rtx
eval "$(rtx activate zsh)"

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# pnpm
export PNPM_HOME="/Users/sylvesterhofstra/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"


#!/bin/sh

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# colors
autoload -Uz colors && colors

# useful Functions
source "$ZDOTDIR/zsh-functions"

# normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_completion "esc/conda-zsh-completion" false
