# Dotfiles for [@edwardnguyen225](http://www.facebook.com/trinhan.vn)


This repository contains my personal dotfiles. They are managed using [Dotbot](https://github.com/anishathalye/dotbot).

## Structure

The repository is structured as follows:

- `config/`: Contains configuration files for various tools like tmux, neovim, alacritty, etc.
- `dotbot/`: Contains the Dotbot tool and its configuration.
- `install`: A script to install the dotfiles using Dotbot.

## Installation

To install the dotfiles, run the following command in the root directory of the repository:

```sh
./install
```

This will symlink the appropriate files to your home directory. Any existing config files will be backed up.

## Configurations

This repository contains configurations for the following tools:

- [alacritty](./config/alacritty/)
- [btop](./config/btop/)
- [fish](./config/fish/)
- [gh](./config/gh/)
- [gh-copilot](./config/gh-copilot/)
- [github-copilot](./config/github-copilot/)
- [htop](./config/htop/)
- [iterm2](./config/iterm2/)
- [karabiner](./config/karabiner/)
- [kitty](./config/kitty/)
- [lazygit](./config/lazygit/)
- [nvim](./config/nvim/)
- [tmux](./config/tmux/)
