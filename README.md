# よく使う機能
- </space>t: tagbar
- </space>n: nerdtree
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
curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
pip install virtualenv virtualenvwrapper
pip install flake8 pyflakes pep8 pylint jedi

cd ~/.vim/bundle/jedi-vim/jedi/
git submodule update --init

# 下記の3行を.zshrcに追記
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /path/to/your/virtualenvwrapper.sh

brew install pyenv-virtualenv
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)";' >> ~/.zshrc

pyenv install <version>
pyenv global <version>

# node
brew install nodebrew
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.zshrc
nodebrew install-binary stable

# npm install eslint
```
