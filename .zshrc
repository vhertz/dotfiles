export LANG="en_US.UTF-8"

# Load local definitions
if [ -f "${HOME}/.zshrc.local" ]; then
    . "${HOME}/.zshrc.local"
fi

# Set common aliases
if [ "$(uname)" = "Darwin" ]; then
    alias ls="ls -G"
else
    alias ls="ls --color=auto"
fi
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -al"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ..="cd .."
