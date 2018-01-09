# よく使う機能
- </space>t: tagbar
- </space>n: nerdtree
- <c-e,>: htmタグ展開
- TagsGenerate!: ctags生成

# Setup
```
brew install vim --with-lua

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"")"
brew install zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

brew tap peco/peco
brew install peco

brew install git

brew install ag

# ctags
brew install ctags
echo alias ctags='/usr/local/Cellar/ctags/<version>/bin/ctags' >> ~/.zshrc

# ruby
brew install rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

rbenv install <version>
rbenv rehash
rbenv global <version>

rbenv exec gem install bundler
rbenv rehash
# rbenv exec gem install rubocop

brew install rsense
ruby /usr/local/Cellar/rsense/0.3/libexec/etc/config.rb > ~/.rsense

# python
curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python
sudo pip install virtualenv
sudo pip install flake8 pyflakes pep8 pylint jedi

cd ~/.vim/bundle/jedi-vim/jedi/
git submodule update --init

# 下記の3行を.zshrcに追記
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

brew install pyenv-virtualenv
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)";' >> ~/.zshrc

git clone git://github.com/yyuu/pyenv-update.git ~/.pyenv/plugins/pyenv-update

pyenv install <version>
pyenv global <version>

# node
# brew install nodebrew
curl -L http://git.io/nodebrew  | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.zshrc
nodebrew install-binary stable

nodebrew use <version>
npm install -g bower, grunt-cli

# npm install -g eslint

brew install automake
brew install pkg-config

brew tap sanemat/font
brew install Caskroom/cask/xquartz
brew install ricty

# Ricty
cd /usr/local/Cellar/ricty/<version>/share/fonts/
sudo cp Ricty*.ttf /Library/Fonts/
fc-cache -vf
# iterm2のPerformances > Profiles > TextからフォントをRictyに変更

# vim+tabでエラー出る場合
rm ~/.zcompdump*
exec zsh

brew install tmux
install reattach-to-user-namespace

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ctrl+kで画面クリアできるようにiterm2で下記を設定
Preferences -> Keys -> + (add new global shortcut)
Keyboard shortcut: ⌘+k
Action: Send text
value: clear\n
```
