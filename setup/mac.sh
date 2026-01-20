#! /bin/zsh

dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# clone dotfiles if it doesn't already exist
if [ ! -d ~/.dotfiles ]; then
  echo "Cloning .dotfiles"
  git clone --bare git@github.com:jyeharry/.dotfiles.git ~/.dotfiles || { echo "Failed cloning .dotfiles"; exit 1 }
  eval "$dotfiles checkout -f || { echo \"Failed checking out .dotfiles\"; exit 1 }"
  eval "$dotfiles submodule update --init --recursive || { echo \"Failed initialising submodules\"; exit 1 }"
  eval "$dotfiles config --local status.showUntrackedFiles no || { echo 'Failed to set git config'; exit 1; }"
fi

if ! command -v brew &> /dev/null; then
  echo "\nInstalling homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || { echo 'Failed to install homebrew'; exit 1; }
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew bundle --file ~/brews.txt || { echo 'Failed brew-installing something'; exit 1; }

if command -v bat &> /dev/null; then
  bat cache --build
fi

mise install

if [[ ! -d ~/Applications/iTerm.app ]]; then
  echo "\nInstalling iTerm2"
  curl -L https://iterm2.com/downloads/stable/latest --output ~/Downloads/iTerm.zip || { echo 'Failed downloading iTerm2 with curl'; exit 1; }
  unzip ~/Downloads/iTerm.zip -d ~/Applications/ || { echo 'Failed unzipping and installing iTerm2'; exit 1; }
fi

exec zsh

echo "\nDon't forget to set Hack Nerd Font Mono in terminal preferences"
