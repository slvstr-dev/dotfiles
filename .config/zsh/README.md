# Customizing .zshrc Configuration

This repository contains a main `.zshrc` configuration file, but you can extend it by creating additional `.zshrc` files in this directory.

## Extending .zshrc

1. Create a custom file, e.g., `.zshrc.personal` or `.zshrc.work`.
2. These files will automatically be sourced by the main `.zshrc` but will **not** be tracked by Git.
3. Add your custom aliases, functions, or settings specific to your environment.

Files such as `.zshrc.*` will not be tracked by Git unless they are `.zshrc.template`, which contains a description of how to add extra settings.
