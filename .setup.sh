#! /bin/zsh

git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no || { echo 'Failed to set git config'; exit 1; }

if ! command -v brew &> /dev/null; then
  echo "\nInstalling homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || { echo 'Failed to install homebrew'; exit 1; }
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install \
  bat \
  composer \
  fd \
  font-hack-nerd-font \
  fzf \
  gh \
  git \
  go \
  neovim \
  obsidian \
  oven-sh/bun/bun \
  pngpaste \
  python3 \
  rbenv \
  ripgrep \
  rlwrap \
  sd \
  swift-format \
  swiftlint \
  tree \
  zoxide \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  && brew install --cask nikitabobko/tap/aerospace || { echo 'Failed brew-installing something'; exit 1; }

# installs NVM (Node Version Manager)
if [ ! -d "$HOME/.nvm" ]; then
  echo "\nInstalling nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash || { echo 'Failed installing nvm'; exit 1; }
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

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

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "\nInstalling ohmyzsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || { echo 'Failed installing omz'; exit 1; }
  rm ~/.zshrc
fi

git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout .zshrc

source ~/.zshrc

echo "\nDon't forget to set Hack Nerd Font Mono in terminal preferences"
