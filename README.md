# dotfiles

My macOS dotfiles, managed with chezmoi.

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
- **AI agent** — Claude Code _(work)_
- **Agent sandboxing** — Docker Sandboxes _(work)_
- **Agent workspaces** — Herdr _(work)_

## Setup

### Prerequisites

1. Update macOS: `sudo softwareupdate -ia`
2. Install Xcode Command Line Tools: `xcode-select --install`
3. Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### Install

1. Install chezmoi: `brew install chezmoi` (or `sh -c "$(curl -fsLS get.chezmoi.io)"`)
2. `chezmoi init git@github.com:slvstr-dev/dotfiles.git --apply`
   - You'll be prompted for setup type (work/personal) and an optional MCP url
3. Restart shell

### Day-to-day

- Edit configs: `chezmoi edit ~/.config/ghostty/config`
- Apply changes: `chezmoi apply`
- See pending changes: `chezmoi diff`
- Pull & apply updates: `chezmoi update`
- Check out of sync: `chezmoi status`
- Sync live changes back: `chezmoi re-add`

### Homebrew

```bash
brew:install
brew:update
brew:cleanup
brew:uninstall
```

### Zed

Install manually via the Zed extensions panel:

- Catppuccin

### GitHub

```bash
gh auth login
```

### Raycast

Disable Spotlight hotkey and assign it to Raycast using the [Raycast hotkey instructions](https://manual.raycast.com/hotkey).

### Docker Sandboxes _(work)_

```bash
sbx login
sbx policy init deny-all
sbx:claude [name-suffix]
```

### Herdr _(work)_

```bash
herdr:setup
herdr:setup --client
herdr:setup --client ABC-12345
herdr:setup --app 1.404 --client
```
