# dotfiles

My macOS dotfiles, managed with chezmoi.

## Stack

- **Shell** — Zsh + Starship
- **Terminal** — Ghostty
- **Editor** — Neovim + Zed
- **Runtime manager** — mise
- **Package manager** — Homebrew + Bun
- **Package shortcuts** — ni

## Setup

### Prerequisites

1. Update macOS: `sudo softwareupdate -ia`
2. Install Xcode Command Line Tools: `xcode-select --install`

### Install

1. Install chezmoi: `brew install chezmoi` (or `sh -c "$(curl -fsLS get.chezmoi.io)"`)
2. `chezmoi init https://github.com/slvstr-dev/dotfiles.git --apply`
   - You'll be prompted for machine type (work/personal)
3. Restart shell

### Day-to-day

- Edit configs: `chezmoi edit ~/.config/ghostty/config`
- Apply changes: `chezmoi apply`
- See pending changes: `chezmoi diff`
- Pull & apply updates: `chezmoi update`
- Check out of sync: `chezmoi status`
- Sync live changed back: `chezmoi re-add`

### Homebrew

```bash
brew-install
brew-update
brew-cleanup
brew-uninstall
```

### Zed

Install manually via the Zed extensions panel:

- Rosé Pine (or Catppuccin)

### GitHub

```bash
gh auth login
```

### Raycast

Disable Spotlight hotkey and assign it to Raycast using the [Raycast hotkey instructions](https://manual.raycast.com/hotkey).
