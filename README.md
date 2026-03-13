# dotfiles

My macOS dotfiles, managed with GNU Stow.

## Stack

- **Shell** — Zsh + Starship
- **Terminal** — Ghostty
- **Editor** — Neovim + Zed
- **Runtime manager** — mise
- **Package manager** — Homebrew + Bun
- **Package shortcuts** — ni

## Setup

### 1. Prerequisites

```bash
sudo softwareupdate -ia
xcode-select --install
git clone https://github.com/slvstr-dev/dotfiles.git ~/dotfiles
```

### 2. Stow

```bash
cd ~/dotfiles
find . -name ".DS_Store" -delete
stow */ -v
```

### 3. Homebrew

Brewfiles are split by config (`shared`, `personal`, `work`). The default is `shared`. Override by setting `BREW_CONFIG` in your `.zshrc.local`:

```zsh
export BREW_CONFIG="work"
```

```bash
brew-install
brew-update
brew-cleanup
brew-uninstall
```

### 4. Zed

Install manually via the Zed extensions panel:

- Rosé Pine (or Catppuccin)

### 5. GitHub

```bash
gh auth login
```

### 6. Raycast

Disable Spotlight hotkey and assign it to Raycast using the [Raycast hotkey instructions](https://manual.raycast.com/hotkey).
