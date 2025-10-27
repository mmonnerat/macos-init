#!/bin/bash
set -e

echo "😍 Kick starting your machine..."
echo
sleep 2

INITDIR=$HOME/dev/projects/$USER/macos-init

# OSX Tweaks
echo "🖱 Setting up OSX tweaks..."
echo
echo "This step will TRY to configure the following OSX settings:"
echo " * Finder: Show Path bar"
echo " * Finder: Show Hidden files"
echo
defaults write com.apple.finder ShowPathbar 1
defaults write com.apple.finder AppleShowAllFiles YES

# Generate SSH
echo "🔶 Generating new SSH key..."
echo
ssh-keygen -t rsa -b 4096
echo
echo "Adding newly-created key to ssh-agent. You will be prompted for the password."
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

# Manual instruction suggested
echo "🛑 Manual step before proceeding!"
echo
echo "To clone the init repositories the newly created SSH key needs to be uploaded to GitHub."
pbcopy < ~/.ssh/id_rsa.pub
echo "The public key (~/.ssh/id_rsa.pub) was copied to your clipboard."
echo
echo "  👾 Upload new SSH key to GH - https://github.com/settings/ssh/new"
echo

read -n 1 -s -r -p "Press any key to continue..."
echo

# Clone repos with dotfiles
echo "🐛 Creating workspace and cloning general init project..."
echo
mkdir -p ~/dev/projects/$USER
git clone git@github.com:mmonnerat/macos-init.git $INITDIR
cp $INITDIR/.ssh/config ~/.ssh/config

# Install all needed software
echo "⚙️ Installing all needed software from brew and brew cask..."
echo
brew update
brew install --cask visual-studio-code
brew install --cask insomnia
brew install --cask rectangle 
brew install --cask clipy
brew install python3 pipenv go node nvm minikube kubernetes-cli jq awscli derailed/k9s/k9s tree

# Install RVM
echo "Installing Ruby Version Manager - RVM ..."
echo "gem: --no-document" >> ~/.gemrc
curl -sSL https://get.rvm.io | bash -s stable
type rvm | head -1

# Install SDK Man
echo "Installing The Software Development Kit Manager - SDKMan ..."
curl -s "https://get.sdkman.io" | bash

# TODO copy .gitignore and set it up
# git config --global core.excludesfile ~/.gitignore

# Clone Powerlevel10k ZSH theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Setup dotfiles
echo "🎫 Copying dotfiles..."
echo
echo "This step will:"
echo " * Copy .zshrc to home"
echo
cp $INITDIR/.zshrc ~/
source ~/.zshrc

# Brew doctor to get an idea of the current state of the things
echo "Brew doctor to get an idea of the current state of the things"
brew doctor

echo "🎉 All done!"
echo
echo "OSX tweaks to do manually:"
echo " ⚙️  Displays > Resolution > More Space"
echo " ⚙️  Keyboard > Input Sources > add U.S. International - PC > remove others"
echo " ⚙️  Accessibility > Zoom > Use scroll gesture with modifier keys to zoom > ^ Control"
echo " ⚙️  Security & Privacy > General > Require password immediately after sleep or screen saver begins"
echo " ⚙️  Keyboard > Text > disable Correct spelling automatically and Capitalize words automatically"
echo
echo "Application configuration to do manually:"
echo " 📅 Calendar:"
echo "  ⚙️  Add Google accounts, configure refreshing for every 5min"
echo
echo " 👓 Rectangle:"
echo "  ⚙️  System Preferences > Security & Privacy > Accessibility > Rectangle"
echo
echo " 📋 Clipy-App: Open-source clipboard manager"
echo "  ⚙️  System Preferences > Security & Privacy > Accessibility > Clipy"
echo
echo " 🌕 Firefox:"
echo "  ⚙️  Set as default browser"
echo "  ⚙️  Login to Firefox to synchronize extensions"
echo
echo "🌈 HAVE FUN! 🦄"
