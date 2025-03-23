set -gx PATH ~/development/flutter/bin $PATH
set -gx PATH "/opt/homebrew/bin:/bin:/usr/bin" $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# platform-tools
set -g PLATFORM $HOME/Documents/DivestOS/platform-tools

if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end

fzf --fish | source
