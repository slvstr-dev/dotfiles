# dotfiles

Welcome to my dotfiles repository! This collection comprises all the configuration files I utilize to set up and customize my system. Feel free to explore and follow the step-by-step instructions to apply these configurations to your own machine.

![Screenshot of project](https://raw.githubusercontent.com/slvstr-dev/dotfiles/master/screenshot.png)

## Before You Start

Ensure a smooth setup by following these steps:

1. **Clone Repository:**
   Use the following command to clone the repository to the root of your macOS system:

   ```bash
   git clone https://github.com/slvstr-dev/dotfiles.git
   ```

2. **Install Developer Tools:**
   Ensure the necessary developer tools are installed with:

   ```bash
   xcode-select --install
   ```

   Follow on-screen prompts to complete the installation.

3. **Update System Software:**
   Install available software updates with detailed information:

   ```bash
   sudo softwareupdate -ia --verbose
   ```

   Ensure your system is up-to-date before proceeding with the setup.

## Instructions

### Homebrew

I leverage Homebrew to automate the download and update process for commonly used applications.

#### Install

Follow these commands:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
cd ~/dotfiles/homebrew/.config/homebrew
brew install wget
brew bundle install
```

#### Update

To update, run:

```bash
cd ~/dotfiles/homebrew/.config/homebrew
brew bundle --verbose
brew cleanup --verbose
brew doctor --verbose
```

#### Cleanup

Remove Homebrew dependencies not listed in the Brewfile:

```bash
cd ~/dotfiles/homebrew/.config/homebrew
brew bundle --force cleanup
```

#### Reinstall

Reinstall Homebrew dependencies from the Brewfile:

```bash
cd ~/dotfiles/homebrew/.config/homebrew
brew uninstall --force $(brew list)
brew autoremove
brew bundle install
```

### Stow

Use Stow to create symlinks for the configs inside the dotfiles folder. Resolve conflicts by removing `.zsh`-related files from your root folder:

```bash
cd ~/dotfiles
find . -name ".DS_Store" -delete
stow */
```

> [!NOTE]
> If conflicts persist, manually merge contents of the zsh-folder.

### Kitty

Ensure that Kitty, my terminal of choice, is working and configured. Confirm the usage of the [catppuccin](https://github.com/catppuccin/kitty) theme.

> [!TIP]
> For an enhanced experience, use the [CaskaydiaCove Nerd Font](https://www.nerdfonts.com/font-downloads) as a patched font.

### Vercel CLI

Log in to your Vercel account through Vercel CLI:

```bash
vercel login
```

> [!NOTE]
> For additional information, refer to the [Vercel CLI Overview](https://vercel.com/docs/cli).

### GitHub CLI

Authenticate with a GitHub instance:

```bash
gh auth login
```

> [!NOTE]
> Explore further details in the [GitHub CLI manual](https://cli.github.com/manual/).

### mise

Ensure the right tool versions with [mise-en-place](https://github.com/jdx/mise).

### Raycast

Disable Spotlight search hotkey and set it as the [default hotkey for Raycast](https://manual.raycast.com/hotkey).

---

Congratulations 🎉, you've successfully set up your macOS using my dotfiles! Feel free to enjoy and customize them to suit your preferences!
