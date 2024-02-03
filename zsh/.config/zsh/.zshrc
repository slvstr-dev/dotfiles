# 1. Options and Settings
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef
zle_highlight=('paste:none')
unsetopt BEEP

# 2. Completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# 3. Colors
autoload -Uz colors && colors

# 4. Mise
eval "$(mise activate zsh)"

# 5. Functions
source "$ZDOTDIR/zsh-functions"

# 6. Files to Source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# 7. Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_completion "esc/conda-zsh-completion" false
