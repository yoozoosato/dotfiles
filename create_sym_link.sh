# screen を起動時に立ち上げたい
ln -s $HOME/dotfiles/.screenrc $HOME/.screenrc

# 以下 .zsh 用。読み込み順が zshenv > zprofile > zshrc > zlogin なので、冒頭の .zshenv で ZDOTDIR を指定してやる
ln -s $HOME/dotfiles/.zshenv $HOME/.zshenv
ln -s $HOME/dotfiles/.zsh/.zshrc $HOME/.zsh/.zshrc
ln -s $HOME/dotfiles/.zsh/.zaliases $HOME/.zsh/.zaliases

