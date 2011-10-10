#if [[ -n $SSH_CONNECTION ]]; then
#  export PS1='%m:%3~$(git_info_for_prompt)%# '
#else
#  export PS1='%3~$(git_info_for_prompt)%# '
#fi
#


export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true
export EDITOR='mate -w'


HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=10000