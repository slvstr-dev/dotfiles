typeset -U path fpath
path=(/opt/homebrew/{bin,sbin} $path)
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

export EDITOR="zed --wait"
export VISUAL="zed --wait"
export EZA_CONFIG_DIR="$HOME/.config/eza"
export GPG_TTY=$(tty)
export MANWIDTH=999
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export XDG_CONFIG_HOME="$HOME/.config"

unsetopt BEEP
