# dotfiles

This repo contains all the dotfiles I use to setup my system. Take a look or read through the steps, in order and before installing, to try them out yourself.

![Screenshot of project](https://raw.githubusercontent.com/slvstr-dev/dotfiles/master/screenshot.png)

## Before starting

- Clone this repository
- Install command line developer tools.

## Instructions

### Homebrew

I use Homebrew so I can automate downloading, and updating the apps I use commonly.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After Homebrew is finished installing you should run the script:

```
brew install wget
```

Next; install all the applications listed in the Brewfile.

```
brew bundle --file ~/dotfiles/homebrew/.config/homebrew/Brewfile
```

**NOTE** Currently the node version set through n isn't used when another version of node is already installed through Homebrew. If this is the case you should remove node from Homebrew:

```
brew uninstall --ignore-dependencies node
brew uninstall --force node
```

**NOTE** Downloading large applications, like Xcode, will take a while. Adjust the Brewfile by removing the line of the application you don't want to install.

Updating can be done by running this oneliner:

```
cd ~/dotfiles/homebrew/.config/homebrew && sudo softwareupdate -ia --verbose && brew bundle --verbose && brew cleanup --verbose && brew doctor --verbose
```

### Stow

Stow will be used to create symlinks the configs inside the dotfiles folder. This might cause conficts at certain moments. Most of them can be resolved by running the commands below:

```sh
cd ~/dotfiles
find . -name ".DS_Store" -delete
```

Now you should be able to link the configs without any errors.

```sh
stow */
```

**NOTE** If you do get errors it might be because of your zsh configuration. You might have some settings you don't want to override, so be sure to resolve these issues manually by merging the contents of the zsh-folder manually.

### Kitty

At this point Kitty, my terminal of choice, should be working and configurated. The easiest way to check this is by determine if the [catppuccin](https://github.com/catppuccin/kitty) theme is being used.

For better DX I like to make use a patched font, called [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads). After succesfully downloading the font you should drag the unzipped folder to an opened window of the preinstalled Font Book-app.

### Vercel CLI

The vercel login command allows you to login to your Vercel account through Vercel CLI.

```
vercel login
```

**NOTE** Additional information can be found in the [Vercel CLI Overview](https://vercel.com/docs/cli).

### GitHub CLI

To authenticate with a GitHub instance, run:

```
gh auth login
```

**NOTE** Additional information can be found in the [GitHub CLI manual](https://cli.github.com/manual/).

### Ni

To assure I'm using the right package manager I use [ni](https://github.com/antfu/ni), which you can install running this script:

```
npm i -g @antfu/ni
```

### Raycast

Disable Spotlight search hotkey and set this as the [default hotkey for Raycast](https://manual.raycast.com/hotkey).

---

Congrats 🎉, you're done setting up your mac using my dotfiles! Have fun using/adjusting them!
