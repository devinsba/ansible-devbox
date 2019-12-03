#!/bin/sh

xcode-select --install

while ! xcode-select -p 1>/dev/null 2>/dev/null
do
  sleep 10
done

if ! xcode-select -p 1>/dev/null 2>/dev/null; then
  echo "xcode command line tools not installed"
  exit 1
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew cask install iterm2
