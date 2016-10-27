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
alias sl=ls
alias w3m='w3m -no-cookie'
alias t='make test'
alias m='make'
alias b='bazel build //...'

source ~/.git-completion.sh
source ~/.git-prompt.sh

HOST=`uname -n`
case $HOST in
"iMac.local") HOST=iMac;;
"caffeine") HOST=csc;;
"high-fructose-corn-syrup") HOST=hfcs;;
"artificial-flavours") HOST=af;;
"maltodextrin") HOST=malto;;
"natural-flavours") HOST=natf;;
"bit-shifter") HOST=bs;;
"corn-syrup") HOST=cs;;
esac
# This was a funny way to achieve part of the above
# HOST=`uname -n`
# export HOST=$(grep -e "^`grep -e "^[^\ ]*\ $HOST" /etc/hosts | head -n 1 | sed -e "s/\ .*//"`" /etc/hosts | sed -e "s/.*\ //" | while read line ; do if [[ ${line:0:1} == ${HOST:0:1} ]]; then echo $line; fi; done | awk '{ print length, $0 }' | sort -n | awk '{$1=""; print $0}' | head -n 1 | sed -e 's/^\ //')

if [ $HOST == "solidangle" ]; then
  alias home="ssh jacob@localhost -p 13371"
else
  alias home="ssh j3parker@solidangle.ca 'ssh jacob@localhost -p 13371'"
fi

export PS1='\[\e[0;36m\]\u\[\e[0;92m\]:\[\e[0;33m\]$HOST$(__git_ps1 "\[\e[0;92m\]:\[\e[0;31m\]%s")\[\e[0;92m\]:\[\e[0;93m\]\w\[\e[m\]\n$ '

export EDITOR=vim
export VISUAL=vim

LANG=en_US.UTF-8

alias gd='git diff'

### ????
alias sudo='sudo '

alias shutdown='echo wrong machine'

export PATH=$PATH:$HOME/opt/bin:$HOME/opt/usr/local/bin
