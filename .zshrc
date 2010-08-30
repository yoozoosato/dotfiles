# .zshrc

# key bind
bindkey -e

# history
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=200000
setopt share_history
setopt  HIST_IGNORE_DUPS
setopt hist_ignore_space
setopt list_packed 

# correction 
setopt  CORRECT CORRECT_ALL

# completion
autoload -U compinit
compinit 

# auto cd
setopt auto_cd
setopt auto_pushd 

# predict
#autoload predict-on
#predict-on

# prompt settings
autoload -U colors
colors
PROMPT="%{${fg[white]}%}%m%{${fg[white]}%}%#%{$reset_color%} "
RPROMPT=" %/:$WINDOW"

# editor
export EDITOR=vi

# aliases
#alias ls='ls --color=auto --show-control-chars'
alias ll='ls -l'
alias la='ls -aF'
alias rm='rm -i'
alias cp='cp -i'
alias vi='vim'
alias rm='nocorrect rm'
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias spec='nocorrect spec'
alias mkdir='nocorrect mkdir'
alias restartfinder='killall Dock'
#alias ssh='ssh -o ServerAliveInterval=60'

# LANG
export LANG=ja_JP.UTF-8

# load host specific settings
[ -f $HOME/.zshrc.mine ] && source $HOME/.zshrc.mine

