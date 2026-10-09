# dotfiles

My macOS dotfiles, managed with chezmoi.

## Setup

### Prerequisites

1. Update macOS: `sudo softwareupdate -ia`
2. Install Xcode Command Line Tools: `xcode-select --install`
3. Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### Install

1. Install chezmoi: `brew install chezmoi` (or `sh -c "$(curl -fsLS get.chezmoi.io)"`)
2. `chezmoi init git@github.com:slvstr-dev/dotfiles.git --apply`
3. Answer the setup prompts
4. Restart shell

### Day-to-day

Dotfiles should only be edited in this repo (`df`) and applied by running `chezmoi apply`.

## Shared

### Homebrew

```bash
brew:install
brew:update
brew:cleanup
brew:uninstall
```

### GitHub

```bash
gh auth login
```

### Raycast

Disable Spotlight hotkey and assign it to Raycast using the [Raycast hotkey instructions](https://manual.raycast.com/hotkey).

## Work

### Herdr

```bash
herdr:open [cmd]               # workspace from cwd + optional cmd
herdr:worktree <branch> [cmd]  # worktree from repo root for a branch + optional cmd
```
