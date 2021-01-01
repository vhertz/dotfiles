# set locale
set -x LANG "en_US.UTF-8"

# function to add path
function add_path
  set ADDED_PATH $argv[1]
  not contains $ADDED_PATH $PATH
    and set -x PATH $ADDED_PATH $PATH
end

# Load a local conf (config.fish.local)
set LOCAL_CONF $HOME/.config/fish/config.fish.local
if test -e $LOCAL_CONF
    source $LOCAL_CONF
end

# common aliases
if test (uname) = "Darwin"
    alias ls="ls -G"
else
    alias ls="ls --color=auto"
end
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -al"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ..="cd .."
