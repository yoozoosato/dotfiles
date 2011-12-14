# .zshrc

# aliases
source $ZDOTDIR/.zaliases

# Emacs like key bind. Vi like bind is 'bindkey -v'
bindkey -e

######################################################################
# history
#
######################################################################
# size
HISTFILE=~/.zhistory
HISTSIZE=500000
SAVEHIST=500000

# options
# share history file
setopt share_history
# do not record duplicate command into history file
setopt hist_ignore_dups
# delete same old command from history file
setopt hist_ignore_all_dups
# if the first character on the line is blank, don't save the command
setopt hist_ignore_space
# do not record 'history' command into history file
setopt hist_no_store


# this is not related to history. i'll move this.
setopt list_packed

# correction
setopt  CORRECT CORRECT_ALL

# completion
autoload -U compinit
compinit

######################################################################
# change directory
#
######################################################################
setopt auto_cd
setopt auto_pushd
# delete same old directory from directory stack
setopt pushd_ignore_dups

# predict
#autoload predict-on
#predict-on

# prompt settings
autoload -Uz colors
colors
# left prompt. Hostname only.
PROMPT="%{${fg[white]}%}%m%{${fg[white]}%}%#%{$reset_color%} "

# editor
EMACSCLIENT=`which emacsclient`
export EDITOR=$EMACSCLIENT

# screen
SCREEN=`which screen`
if [ $SHLVL = 1 ];then
$SCREEN -U
fi

# LANG
export LANG=ja_JP.UTF-8

# vcs-info
setopt prompt_subst
autoload -Uz add-zsh-hook
# for vcs_info
function _precmd_vcs_info() {
  LANG=en_US.UTF-8 vcs_info
}
add-zsh-hook precmd _precmd_vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats "%b" "%s"
zstyle ':vcs_info:*' actionformats "%b|%a" "%s"
function vcs_info_for_git() {
  VCS_GIT_PROMPT="${vcs_info_msg_0_}"
  VCS_GIT_PROMPT_CLEAN="%{${fg[green]}%}"
  VCS_GIT_PROMPT_DIRTY="%{${fg[yellow]}%}"

  VCS_GIT_PROMPT_ADDED="%{${fg[cyan]}%}A%{${reset_color}%}"
  VCS_GIT_PROMPT_MODIFIED="%{${fg[yellow]}%}M%{${reset_color}%}"
  VCS_GIT_PROMPT_DELETED="%{${fg[red]}%}D%{${reset_color}%}"
  VCS_GIT_PROMPT_RENAMED="%{${fg[blue]}%}R%{${reset_color}%}"
  VCS_GIT_PROMPT_UNMERGED="%{${fg[magenta]}%}U%{${reset_color}%}"
  VCS_GIT_PROMPT_UNTRACKED="%{${fg[red]}%}?%{${reset_color}%}"

  INDEX=$(git status --porcelain 2> /dev/null)
  if [[ -z "$INDEX" ]];then
    STATUS="${VCS_GIT_PROMPT_CLEAN}${VCS_GIT_PROMPT}%{${reset_color}%}"
  else
    STATUS=" ${VCS_GIT_PROMPT_DIRTY}${VCS_GIT_PROMPT}%{${reset_color}%}"
    if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_UNMERGED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^R ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_RENAMED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_DELETED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_UNTRACKED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_MODIFIED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^A ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_ADDED$STATUS"
    elif $(echo "$INDEX" | grep '^M ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_ADDED$STATUS"
    fi
  fi
  echo "${STATUS}"
}
function vcs_info_with_color() {
  VCS_PROMPT_PREFIX="%{${fg[green]}%}[%{${reset_color}%}"
  VCS_PROMPT_SUFFIX="%{${fg[green]}%}]%{${reset_color}%}"

  VCS_NOT_GIT_PROMPT="%{${fg[green]}%}${vcs_info_msg_0_}%{${reset_color}%}"

  if [[ -n "${vcs_info_msg_0_}" ]]; then
    if [[ "${vcs_info_msg_1_}" = "git" ]]; then
      STATUS=$(vcs_info_for_git)
    else
      STATUS=${VCS_NOT_GIT_PROMPT}
    fi
    echo " ${VCS_PROMPT_PREFIX}${STATUS}${VCS_PROMPT_SUFFIX}"
  fi
}
RPROMPT='[%~]$(vcs_info_with_color)'

######################################################################
# emacs & zsh (dired, cde)
######################################################################
## http://masutaka.net/chalow/2011-09-28-1.html
## Invoke the ``dired'' of current working directory in Emacs buffer.
function dired () {
  emacsclient -e "(dired \"$PWD\")"
}

## Chdir to the ``default-directory'' of currently opened in Emacs buffer.
function cde () {
    EMACS_CWD=`emacsclient -e "
     (expand-file-name
      (with-current-buffer
          (nth 1
               (assoc 'buffer-list
                      (nth 1 (nth 1 (current-frame-configuration)))))
        default-directory))" | sed 's/^"\(.*\)"$/\1/'`

    echo "chdir to $EMACS_CWD"
    cd "$EMACS_CWD"
}
######################################################################


# load host specific settings
[ -f $HOME/.zshrc.mine ] && source $HOME/.zshrc.mine
