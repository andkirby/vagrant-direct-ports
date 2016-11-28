#!/usr/bin/env bash

export SHELL='bash'

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# init once
if [ -z "${BASHRC_INIT}" ]; then
    BASHRC_INIT=1
    readonly BASHRC_INIT

    ORIGINAL_PATH=${PATH}
    readonly ORIGINAL_PATH

    # go to docroot by default
    [ -d /usr/src/project ] && cd /usr/src/project
fi

PATH=${ORIGINAL_PATH}
#PATH=${PATH}':'$(cd; pwd)'/.some/path'

export TERM=xterm
export EDITOR=nano

# Colorize PS1 console
# curl -Ls https://gist.github.com/andkirby/389f18642fc08d1b0711d17978445f2b/raw/bashrc_ps1_install.sh | bash
PS1="\n\[\033[01;37m\]\$? "
PS1=${PS1}"\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi)"
PS1=${PS1}" $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[0;32m\]\u@\h'; fi)"
PS1=${PS1}" \[\033[00m\]\D{%T}\[\033[0;33m\] \w\[\033[00m\] \n\$ "
# EOF Colorize PS1 console
