autoload -Uz compinit
if [[ ! -f "$HOME/.zcompdump" ]] || [[ $(find "$HOME/.zcompdump" -mtime +1 2>/dev/null) ]]; then
  compinit
else
  compinit -C
fi
