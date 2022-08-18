export LANG="en_US.UTF-8"

# Source global definitions
if [ -f "/etc/bashrc" ]; then
	. "/etc/bashrc"
fi

# Load local definitions
if [ -f "${HOME}/.bashrc.local" ]; then
    . "${HOME}/.bashrc.local"
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

