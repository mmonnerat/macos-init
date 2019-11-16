# dotfiles
The `pre_kickstart.sh` will install `XCode CLI`, `Homebrew`, `iTerm2` and finally `oh-my-zsh` as a pre-setup.
Then, `kickstart.sh` will automates all the boring work of setting up a new personal machine by installing all software I use and pre-configuring (with the help of dotfiles and OSX hacks) otherwise tedious manual settings.

## Pre-requisites
You need admin rights on the machine.

## Instructions
* Download the `pre_kickstart.sh.sh` and make it executable with `chmod +x pre_kickstart.sh`
* Run `./pre_kickstart.sh`
* Same dance for the `kickstart.sh` file
* Download the `kickstart.sh.sh` and make it executable with `chmod +x kickstart.sh`
* Run `./kickstart.sh`

## Features
These two scriptis will kickstart your machine by installing/configuring:

* Shell (iTerm2 + zsh + oh-my-zsh)
* XCode command-line tools (mostly because of git)
* Generation of new SSH key
* Homebrew (and all software from them on using formulas and casks for a tidy managed system 😍)
* Essential desktop apps
* Dev desktop apps
* Essential shell apps
* Automatic copying and sourcing of my custom dotfiles `.zshrc`

Check the script to know exactly what it does.

## What's missing
There are a bunch of steps which were not automatized yet. 
They are mostly related to OSX settings I'm still figuring out how to change using the CLI (in general it's about changing 'defaults').

**CHECK THE TERMINAL OUTPUT FOR FINAL STEPS!!**

## Credits
Most of stuff here is based on [wormangel](https://github.com/wormangel/)'s [init](https://github.com/wormangel/init) repo.
Thank you!