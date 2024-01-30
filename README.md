# dotfiles

Welcome to my dotfiles repository! This collection includes all the configuration files I use to set up and customize my system. Feel free to explore and follow the step-by-step instructions to apply these configurations to your own machine.

![Screenshot of project](https://raw.githubusercontent.com/slvstr-dev/dotfiles/master/screenshot.png)

## Before You Start

Before diving into the setup process, ensure you complete the following steps:

1. Clone this repository to the root of your macOS system.
2. Install the command line developer tools.

## Instructions

### Homebrew

I leverage Homebrew to automate the download and update process for commonly used applications. Follow these commands:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install wget
brew bundle --file ~/dotfiles/homebrew/.config/homebrew/Brewfile
```

To update, run:

```bash
cd ~/dotfiles/homebrew/.config/homebrew
sudo softwareupdate -ia --verbose
brew bundle --verbose
brew cleanup --verbose
brew doctor --verbose
```

Remove Homebrew dependencies not listed in the Brewfile:

```bash
cd ~/dotfiles/homebrew/.config/homebrew
brew bundle --force cleanup
```

### Stow

Use Stow to create symlinks for the configs inside the dotfiles folder. Resolve conflicts by removing `.zsh`-related files from your root folder:

```bash
cd ~/dotfiles
find . -name ".DS_Store" -delete
stow */
```

If conflicts persist, manually merge contents of the zsh-folder.

### Kitty

Ensure that Kitty, my terminal of choice, is working and configured. Confirm the usage of the [catppuccin](https://github.com/catppuccin/kitty) theme.

For an enhanced experience, use the [CaskaydiaCove Nerd Font](https://www.nerdfonts.com/font-downloads) as a patched font.

### Vercel CLI

Log in to your Vercel account through Vercel CLI:

```bash
vercel login
```

For additional information, refer to the [Vercel CLI Overview](https://vercel.com/docs/cli).

### GitHub CLI

Authenticate with a GitHub instance:

```bash
gh auth login
```

Explore further details in the [GitHub CLI manual](https://cli.github.com/manual/).

### mise

Ensure the right tool versions with [mise-en-place](https://github.com/jdx/mise).

### Raycast

Disable Spotlight search hotkey and set it as the [default hotkey for Raycast](https://manual.raycast.com/hotkey).

---

Congratulations 🎉, you've successfully set up your macOS using my dotfiles! Feel free to enjoy and customize them to suit your preferences!
