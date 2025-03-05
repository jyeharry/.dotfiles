#! /bin/zsh

dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# clone dotfiles if it doesn't already exist
if [ ! -d ~/.dotfiles ]; then
  echo "Cloning .dotfiles"
  git clone --bare git@github.com:jyeharry/.dotfiles.git ~/.dotfiles || { echo "Failed cloning .dotfiles"; exit 1 }
  eval "$dotfiles checkout -f || { echo \"Failed checking out .dotfiles\"; exit 1 }"
  eval "$dotfiles config --local status.showUntrackedFiles no || { echo 'Failed to set git config'; exit 1; }"
fi

if ! command -v brew &> /dev/null; then
  echo "\nInstalling homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || { echo 'Failed to install homebrew'; exit 1; }
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install \
  bat \
  composer \
  fd \
  ffmpeg \
  fnm \
  font-hack-nerd-font \
  fzf \
  gh \
  git \
  go \
  imagemagick \
  lazygit \
  neovim \
  obsidian \
  oven-sh/bun/bun \
  pngpaste \
  poppler \
  python3 \
  rbenv \
  ripgrep \
  rlwrap \
  sd \
  sevenzip \
  swift-format \
  swiftlint \
  tree \
  zoxide \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  && brew install yazi --HEAD \
  && brew install --cask nikitabobko/tap/aerospace || { echo 'Failed brew-installing something'; exit 1; }

# download and install Node.js
if ! command -v node &> /dev/null; then
  echo "\nInstalling node"
  nvm install node || { echo 'Failed nvm installing node'; exit 1; }
fi

if [[ -d "/Applications/iTerm.app" ]]; then
  echo "\nInstalling iTerm2"
  curl -L https://iterm2.com/downloads/stable/latest --output ~/Downloads/iTerm.zip || { echo 'Failed downloading iTerm2 with curl'; exit 1; }
  unzip ~/Downloads/iTerm.zip -d ~/Applications/ || { echo 'Failed unzipping and installing iTerm2'; exit 1; }
fi

exec zsh

echo "\nDon't forget to set Hack Nerd Font Mono in terminal preferences"
