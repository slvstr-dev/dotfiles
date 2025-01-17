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

### 1. Homebrew

Homebrew automates the installation, updating, and management of commonly used applications and tools.

To begin, run the script below, which will guide you through selecting the configuration (`personal` or `work`) and then perform the requested action (`install`, `update`, `cleanup` or `uninstall`).

```bash
cd ~/dotfiles/.config/homebrew
./manager.sh
```

This will check if Homebrew is installed (installing it if necessary) and then apply the selected action to the tools in the chosen Brewfile.

**Note:** If you encounter a "permission denied" error, you'll need to make the script executable first. You can do this by running:

```bash
chmod +x ~/dotfiles/.config/homebrew/manager.sh
chmod +x ~/dotfiles/.config/homebrew/scripts/cleanup.sh
chmod +x ~/dotfiles/.config/homebrew/scripts/install.sh
chmod +x ~/dotfiles/.config/homebrew/scripts/uninstall.sh
chmod +x ~/dotfiles/.config/homebrew/scripts/update.sh
```

### 2. Stow

Use Stow to create symlinks for the configs inside the dotfiles folder. Resolve
conflicts by removing `.zsh`-related files from your root folder:

```bash
cd ~/dotfiles
find . -name ".DS_Store" -delete
stow . -v
```

### 3. Ghostty

Ensure that Ghostty, my terminal of choice, is working and configured.

### 4. mise

Ensure the right tool versions with [mise-en-place](https://github.com/jdx/mise).

### 5. Ni

Detect the relevant package manager to use with
[ni](https://github.com/antfu/ni) based on the lockfiles in your project. This
tool also provides an usefull shorthand (e.g. `pnpm run` => `nr`).

```bash
npm i -g @antfu/ni
```

### 6. GitHub CLI

Authenticate with a [GitHub instance](https://cli.github.com/manual/):

```bash
gh auth login
```

### 7. Raycast

Disable Spotlight search hotkey and set it as the [default hotkey for Raycast](https://manual.raycast.com/hotkey).

---

Congratulations 🎉, you've successfully set up your macOS using my
dotfiles! Feel free to enjoy and customize them to suit your preferences!
