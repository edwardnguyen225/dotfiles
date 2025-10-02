set -gx PATH ~/development/flutter/bin $PATH
set -gx PATH "/opt/homebrew/bin:/bin:/usr/bin" $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Rustlings
set -gx PATH ~/.cargo/bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# platform-tools
set -g PLATFORM $HOME/Documents/DivestOS/platform-tools

if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME /Users/ntnh/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

fzf --fish | source
