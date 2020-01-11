# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
#bindkey -v
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ubuntu/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


autoload -Uz promptinit
promptinit


#PROMPT='%F{red}%n%f@%F{blue}%m%f %F{yellow}%1~%f %# '
PROMPT='%F{yellow}(LXC)%m%f@%F{blue}%2~%f$ '

#aliases
alias ls='ls --color=auto'
alias l'=ls -lA'
alias ...='../..'
alias ....='../../..'

#update PATH
export PATH="$PATH:$HOME/bin"

source /etc/zsh_command_not_found

source /home/ubuntu/.bazel/bin/bazel-complete.bash

