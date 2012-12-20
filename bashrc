# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Aliases
alias secs='date +%s'
alias ls='ls -plG'

# Prompt
export PS1="\[\e[0;32m\]\h\[\e[m\]\[\e[0;0m\].\[\e[m\]\[\e[0;34m\]\u\[\e[m\] in \[\e[0;36m\]\W\[\e[m\]: "

# PATH
export PATH=/users/j3parker/bin:/users/j3parker/opt/bin:/users/j3parker/opt/usr/local/bin:$PATH:/users/j3parker/opt/node/bin

# Other environment variables
EDITOR=vim
VISUAL=vim
