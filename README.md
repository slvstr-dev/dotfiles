# dotfiles

This repo contains all the dotfiles I use to setup my system. Take a look or read through the steps, in order and before installing, to try them out yourself.

## Homebrew

I use Homebrew so I don't have to download, and update, the apps I use seperately.

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

**NOTE** Downloading large applications, like Xcode, will take a while. Adjust the Brewfile by removing the line of the application you don't want to install.

Updating can be done by running this oneliner:

```
sudo softwareupdate -ia --verbose && brew bundle --verbose && brew cleanup --verbose && brew doctor --verbose
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

## Vercel CLI

The vercel login command allows you to login to your Vercel account through Vercel CLI.

```
vercel login
```

**NOTE** Additional information can be found in the [Vercel CLI Overview](https://vercel.com/docs/cli).

## GitHub CLI

To authenticate with a GitHub instance, run:

```
gh auth login
```

**NOTE** Additional information can be found in the [GitHub CLI manual](https://cli.github.com/manual/).

---

Congrats 🎉, you're done setting up your mac using my dotfiles! Have fun using/adjusting them!
