# dotfiles

The dotfiles I use for my setup.

## Stow

Work in progress...

```sh
find . -name ".DS_Store" -delete
```

## Kitty

Work in progress...

## Homebrew

Work in progress...

## Homebrew

First install Homebrew:

```
brew install wget
```

After Homebrew is finished installing you are now able to install all the applications listed in the Brewfile:

```
brew bundle --file ~/.config/homebrew/Brewfile
```

Updating all the Brewfile-applications can be done by running this oneliner:

```
sudo softwareupdate -ia --verbose && brew bundle --verbose && brew cleanup --verbose && brew doctor --verbose=
```

# Neovim

If you prefer a reliable setup, this is how you would install Neovim from source:

**NOTE** Verify the required [build prerequisites](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites).

```sh
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.8
make CMAKE_BUILD_TYPE=Release
sudo make install
```

Updating is as easy as switching branches (and hoping that your config survived).

## Dependencies

Open `nvim` and check if you need to fix something in advance:

```
:checkhealth
```

Run the following commands to install the dependencies:

-   Pynvim implements support for python plugins in Nvim

```sh
pip3 install pynvim
```

-   Neovim client API and neovim remote plugin provider

```sh
npm i -g neovim
```

-   ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern

```sh
brew install ripgrep
```
