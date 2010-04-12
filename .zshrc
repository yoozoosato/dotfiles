# .zshrc

# key bind
bindkey -e

# history
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=200000
setopt  HIST_IGNORE_DUPS
setopt hist_ignore_space
setopt  CORRECT CORRECT_ALL

# prompt settings
autoload -U colors
colors
PROMPT="%{${fg[white]}%}%m%{${fg[white]}%}%#%{$reset_color%} "
RPROMPT=" %/:$WINDOW"

# PATH
export PATH=$PATH:/opt/local/bin:~/bin:$HOME/bin/apache-tomcat-6.0.26/bin

# for perl5.8.8
#export PATH=$HOME/local/bin:$PATH
#export PERL5LIB=$HOME/local/lib/perl5/5.8.8:$HOME/local/lib/perl5/site_perl/5.8.8:$HOME/local/share/perl/5.8.8

# for ruby
export RI="--format bs --width 70"

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

# load ssh-command aliases
[ -f $HOME/.zshrc.alias ] && source $HOME/.zshrc.alias

# for rvm (Ruby Versin Manager)
if [[ -s /Users/yz/.rvm/scripts/rvm ]] ; then source /Users/yz/.rvm/scripts/rvm ; fi
