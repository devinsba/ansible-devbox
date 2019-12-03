#!/bin/sh

if ! xcode-select -p > /dev/null 2>&1; then
  xcode-select --install
fi

while ! xcode-select -p > /dev/null 2>&1
do
  sleep 10
done

if ! xcode-select -p > /dev/null 2>&1; then
  echo "xcode command line tools not installed"
  exit 1
fi

if ! brew commands > /dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew cask install iterm2

#ZSH
brew install zsh
sudo sh -c "echo \"$(which zsh)\" >> /etc/shells"
chsh -s "$(which zsh)"
brew install antibody

#RCM
brew tap thoughtbot/formulae
brew install rcm

#Dotfiles
mkdir -p ${HOME}/.local/opt
git clone git@github.com:devinsba/dotfiles.git "${HOME}/.local/opt/dotfiles"
echo "DOTFILES_DIRS=\"${HOME}/.local/opt/dotfiles\"" > ~/.rcrc
echo "TAGS=\"$(uname)\"" >> ~/.rcrc

rcup -vf
