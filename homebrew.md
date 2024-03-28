# Homebrew Backup & Restore

Homebrew simplifies software installation and updates on Mac.
For easy backup and restore of Homebrew packages:

## Brewfiles

Brewfiles contain definitions read by Homebrew. Generate one like this:

```text
tap "heroku/brew"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "homebrew/services"
brew "borgmatic"
cask "iterm2-beta"
```

Restore taps, programs, and cask-based apps with:

`brew bundle`

## Backup

Setup repository:

`brew tap Homebrew/bundle`

Backup to home directory:

`brew bundle dump`

Update Brewfile to reflect current installations:

`brew bundle dump --force`

## Restoring

Restore from default Brewfile location:

`brew bundle`

Specify Brewfile location:

`brew bundle --file=~/Brewfile-20200531`

## Brew Bundle

Brew Bundle manages dependencies efficiently. Key commands:

- `brew bundle install`: Install and upgrade dependencies.
- `brew bundle dump`: Write installed items to Brewfile.
- `brew bundle cleanup`: Uninstall unlisted dependencies.
- `brew bundle check`: Check if all dependencies are installed.
- `brew bundle list`: List all dependencies in Brewfile.

For detailed options:

`$ brew bundle --help`
