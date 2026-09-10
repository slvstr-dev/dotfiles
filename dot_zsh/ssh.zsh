if [[ -z "$SSH_AUTH_SOCK" || ! -S "$SSH_AUTH_SOCK" ]]; then
  eval "$(ssh-agent -s)"
fi
ssh-add -l &> /dev/null || ssh-add
