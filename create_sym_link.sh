# screen を起動時に立ち上げたい
if [ ! -e $HOME/.screenrc ]; then
	ln -s $HOME/dotfiles/.screenrc $HOME/.screenrc
fi

# 以下 .zsh 用。読み込み順が zshenv > zprofile > zshrc > zlogin なので、冒頭の .zshenv で ZDOTDIR を指定してやる
if [ ! -e $HOME/.zshenv ]; then
	ln -s $HOME/dotfiles/.zshenv $HOME/.zshenv
fi

if [ ! -e $HOME/.zsh/.zshrc ]; then
	ln -s $HOME/dotfiles/.zsh/.zshrc $HOME/.zsh/.zshrc
fi

if [ ! -e $HOME/.zsh/.zaliases ]; then
	ln -s $HOME/dotfiles/.zsh/.zaliases $HOME/.zsh/.zaliases
fi
