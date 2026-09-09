# dotfiles

My macOS dotfiles, managed by chezmoi.

## Stack

- **Shell** — Zsh + Starship
- **Terminal** — Ghostty + Fira Code Nerd Font
- **Editor** — Zed
- **Launcher** — Raycast
- **Runtime manager** — mise (Node, Bun)
- **Package manager** — Homebrew
- **Package shortcuts** — ni
- **Directory tools** — zoxide + eza
- **Git** — lazygit + hunk
- **AI agents** — Claude Code + opencode *(work)*
- **Agent sandboxing** — Docker Sandboxes *(work)*
- **Agent workspaces** — Herdr *(work)*

## Setup

### Prerequisites

1. Update macOS: `sudo softwareupdate -ia`
2. Install Xcode Command Line Tools: `xcode-select --install`
3. Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### General

#### 1. Homebrew

```bash
brew:install
brew:update
brew:cleanup
brew:uninstall
```

#### 2. chezmoi

1. Install chezmoi: `brew install chezmoi`
2. `chezmoi init git@github.com:slvstr-dev/dotfiles.git --apply`
3. You'll be prompted for machine type (work/personal)
4. Restart terminal

#### 3.Raycast

Disable Spotlight hotkey and assign it to Raycast using the [Raycast hotkey instructions](https://manual.raycast.com/hotkey).

#### 4. Zed

Install 'Catppuccin' manually via the Zed extensions panel.

### Personal

#### GitHub

```bash
gh auth login
```

### Work

#### Docker Sandboxes

```bash
sbx login
sbx policy init deny-all
sbx:skills
sbx:run <claude|opencode>
```

#### Herdr

```bash
herdr:setup
herdr:setup --client
herdr:setup --client ABC-12345
herdr:setup --app 1.404 --client
```
