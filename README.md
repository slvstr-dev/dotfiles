# dotfiles

This repo contains all the dotfiles I use to setup my system. Take a look or read through the steps, in order and before installing, to try them out yourself.

## Homebrew

I use Homebrew so I don't have to download, and update, the apps I use seperately.

```
brew install wget
```

After Homebrew is finished installing you are now able to install all the applications listed in the Brewfile.

**NOTE** Downloading large applications, like Xcode, will take a while. Adjust the Brewfile by removing the line of the application you don't want to install.

```
brew bundle --file ~/dotfiles/homebrew/.config/homebrew/Brewfile
```

Updating can be done by running this oneliner:

```
sudo softwareupdate -ia --verbose && brew bundle --verbose && brew cleanup --verbose && brew doctor --verbose=
```

## Stow

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

## Kitty

At this point Kitty, my terminal of choice, should be working and configurated. The easiest way to check this is by determine if the [catppuccin](https://github.com/catppuccin/kitty) theme is being used.

**NOTE** If you're on a mac with an Intel chip you should see errors in your terminal about untracable `/opt/homebrew/bin/brew`-folders. You can resolve them by removing the contents of line one to five from the original `.zprofile` in the dotfiles-folder.

# Neovim

Next, install Neovim. The most reliable way of installing is doing it from source by running the following commands:

```sh
cd ~
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.8
make CMAKE_BUILD_TYPE=Release
sudo make install
```

**NOTE** Updating to newer versions is as easy as switching branches.

Open `nvim` and check if you need to fix something in advance:

```
:checkhealth
```

Inside Neovim you should install & update the plugins with Lazy:

```
space + l
```

Language Server Providers (lsp's) should be managed manually through Mason to fit your needs:

```
space + c + m
```

# Optional setup

## Vercel CLI (remove 'vercel-cli' from Brewfile when unused)

The vercel login command allows you to login to your Vercel account through Vercel CLI.

```
vercel login
```

**NOTE** Additional information can be found in the [Vercel CLI Overview](https://vercel.com/docs/cli).

## GitHub CLI (remove 'gh' from Brewfile when unused)

To authenticate with a GitHub instance, run:

```
gh auth login
```

**NOTE** Additional information can be found in the [GitHub CLI manual](https://cli.github.com/manual/).

## Github Copilot

To configure GitHub Copilot, open Neovim and enter the following command.

```
:Copilot setup
```

Enable GitHub Copilot in your Neovim configuration, or with the Neovim command.

```
:Copilot enable
```

## Hammerspoon (remove "hammerspoon" from Brewfile when unused)

For a better workflow I suggest using Hammerspoon to remap Caps Lock.

Open System Preferences, navigate to `Keyboard` > `Modifier Keys`, and set the `Caps Lock key` to `Control`. After that you should set Hammerspoon to launch at login under `Preferences...`. Lastly, check the `Console...` to if the config loaded without any problems.

**NOTE** If there is an error it's most likely an issue with the spoon. Try reïnstalling [ControlEscape](https://github.com/jasonrudolph/ControlEscape.spoon/releases/tag/v1.0.1) by downloading `ControlEscape.spoon.zip` and moving `ControlEscape.spoon` to `~/dotfiles/hammerspoon/.hammerspoon/Spoons`.

---

Congrats 🎉, you're done setting up your mac using my dotfiles! Have fun using/adjusting them!
