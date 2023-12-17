set -x LANG en_US.UTF-8

set fish_greeting ""

set -gx TERM screen-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hostname always
fish_config theme choose "Rosé Pine Moon"

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias cl clear
alias g git
alias lg lazygit
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH "/opt/homebrew/bin:/bin:/usr/bin" $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# platform-tools
set -g PLATFORM $HOME/Documents/DivestOS/platform-tools
set -gx PATH $PLATFORM $PATH

# dotfiles
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

nvm use lts --silent

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# Ulimit
ulimit -n 8096

status --is-interactive; and /opt/homebrew//bin/rbenv init - fish | source
