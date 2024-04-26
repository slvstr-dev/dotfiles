# dotfiles

Welcome to my dotfiles repository! This collection comprises all the
configuration files I utilize to set up and customize my system. Feel free tool
explore and follow the step-by-step instructions to apply these configurations
to your own machine.

![Screenshot of project](https://raw.githubusercontent.com/slvstr-dev/dotfiles/master/screenshot.png)

## Before You Start

Ensure a smooth setup by following these steps:

1. **Update System Software:**
   Install available software updates with detailed information:

   ```bash
   sudo softwareupdate -ia --verbose
   ```

   Ensure your system is up-to-date before proceeding with the setup.

2. **Install Developer Tools:**
   Ensure the necessary developer tools are installed with:

   ```bash
   xcode-select --install
   ```

   Follow on-screen prompts to complete the installation.

3. **Clone Repository:**
   Use the following command to clone the repository to the root of your macOS system:

```bash
cd ~
git clone https://github.com/slvstr-dev/dotfiles.git
```

## Instructions

### Homebrew

I leverage Homebrew to automate the download and update process for commonly
used applications.

#### Install

Follow these commands to install all packages listed in the Brewfile and the
patched Caskaydia Cove font that I use in my setup:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
cd ~/dotfiles/.config/homebrew
brew bundle install
brew install font-caskaydia-cove-nerd-font
```

#### Update

To update, run:

```bash
cd ~/dotfiles/.config/homebrew
brew bundle --verbose
brew cleanup --verbose
brew doctor --verbose
```

#### Cleanup

Remove Homebrew dependencies not listed in the Brewfile:

```bash
cd ~/dotfiles/.config/homebrew
brew bundle --force cleanup
```

#### Reinstall

Reinstall Homebrew dependencies from the Brewfile:

```bash
cd ~/dotfiles/.config/homebrew
brew uninstall --force $(brew list)
brew autoremove
brew bundle install
```

### Stow

Use Stow to create symlinks for the configs inside the dotfiles folder. Resolve
conflicts by removing `.zsh`-related files from your root folder:

```bash
cd ~/dotfiles
find . -name ".DS_Store" -delete
stow . -v
```

### WezTerm

Ensure that WezTerm, my terminal of choice, is working and configured. Confirm
the usage of the [catppuccin](https://github.com/catppuccin/wezterm) theme. Set
an alternative application icon:

- Open the info pane of the WezTerm.app in the Applications folder.
- Drag wezterm.icns onto the application icon in the info pane.
- Finally delete the icon cache:

```bash
rm /var/folders/*/*/*/com.apple.dock.iconcache
rm -r /var/folders/*/*/*/com.apple.iconservices*
killall Dock
```

### GitHub CLI

Authenticate with a [GitHub instance](https://cli.github.com/manual/):

```bash
gh auth login
```

### mise

Ensure the right tool versions with [mise-en-place](https://github.com/jdx/mise).

### Raycast

Disable Spotlight search hotkey and set it as the [default hotkey for Raycast](https://manual.raycast.com/hotkey).

### Ni

Detect the relevant package manager to use with
[ni](https://github.com/antfu/ni) based on the lockfiles in your project. This
tool also provides an usefull shorthand (e.g. `pnpm run` => `nr`).

```bash
npm i -g @antfu/ni
```

### Optional

- [Figma](https://www.figma.com/)
- [Firefox](https://www.mozilla.org/en-US/firefox/)
- [Google Chrome](https://www.google.com/chrome/)
- [Postman](https://www.postman.com/)
- [Sequel Ace](https://sequel-ace.com/)
- [Vercel CLI](https://vercel.com/docs/cli)
- [Watchman](https://facebook.github.io/watchman/)
- [Yarn](https://yarnpkg.com/)

---

Congratulations 🎉, you've successfully set up your macOS using my
dotfiles! Feel free to enjoy and customize them to suit your preferences!
