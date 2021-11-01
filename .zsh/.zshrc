source ~/.zplug/init.zsh

# macports
PATH=$PATH:/opt/local/bin
# mew
PATH=$PATH:/Applications/Emacs.app/Contents/MacOS/bin
# migemo
PATH=$PATH:/usr/local/bin

# recommended plugins from http://post.simplie.jp/posts/59
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'plugins/git', from:oh-my-zsh
zplug 'yous/lime'

if ! zplug check --verbose; then
	printf 'Install? [y/N]: '
	if read -q; then
		echo; zplug install
	fi
fi
zplug load 

# launch screen
SCREEN=`which screen`
if [ $SHLVL = 1 ];then
	$SCREEN -U
fi

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=10000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
setopt share_history
# rm * の前に確認
setopt rm_star_wait
# VCS情報表示
setopt prompt_subst

# LIME
export LIME_DIR_DISPLAY_COMPONENTS=2


# ANT_HOME
export ANT_HOME=/Users/yozo.sato/bin/apache-ant
export PATH=$PATH:$ANT_HOME/bin

# PATH
# Android SDK
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
# Android NDK
export NDK_ROOT=$HOME/bin/android-ndk-r10e
#export NDK_CCACHE=/opt/local/bin/ccache
# Android tools
export PATH=$PATH:$HOME/Library/Android/sdk/tools/bin
# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
# MySQL
export PATH=$PATH:/usr/local/mysql/bin
# 雑だけど・・・
export PATH=$PATH:$HOME/bin


### aliases
source $HOME/.zaliases

###
# ここから下は Perl 用
###
PATH="/Users/yozo.sato/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/yozo.sato/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/yozo.sato/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/yozo.sato/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/yozo.sato/perl5"; export PERL_MM_OPT;
export LC_ALL=en_US.UTF-8

###
# AWS Cli
###
PATH=$PATH:~/Library/Python/2.7/bin

### 
# rbenv
###
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"


###
# pyenv
###
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH="${PATH}:/Users/yozo.sato/.local/bin"
