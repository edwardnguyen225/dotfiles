# NVM initialisation
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
alias config='/usr/bin/git --git-dir=/Users/hirito/.cfg/ --work-tree=/Users/hirito'
. "/Users/ntnh/.deno/env"
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ntnh/.lmstudio/bin"
