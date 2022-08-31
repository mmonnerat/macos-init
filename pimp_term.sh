#!/bin/bash
set -e

echo "😍 Kick starting your machine..."
echo
sleep 1

# Install dev tools
echo "🤓 Installing XCode CLI tools..."
echo
echo "This launches a GUI application and requires user confirmation."
xcode-select --install

read -n 1 -s -r -p "Press any key to continue..."
echo

# Install homebrew
echo "🔨 Installing homebrew..."
echo
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/cask-versions

# Install proper terminal - iterm2 and oh-my-zsh
echo "❤️ Installing iTerm2 and oh-my-zsh..."
echo
brew cask install iterm2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"