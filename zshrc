# Set locale
export LANG="en_US.UTF-8"

# Define a utility function for adding PATH
addPath() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

# Load a local conf (.zshrc.local)
if [ -e "${HOME}/.zshrc.local" ]; then
    source "${HOME}/.zshrc.local"
fi

# common aliases
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

