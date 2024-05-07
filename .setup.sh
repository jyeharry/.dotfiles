#! /bin/zsh

git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no || { echo 'Failed to set git config'; exit 1; }

brew install neovim ripgrep fd fzf zsh-autosuggestions font-hack-nerd-font bun tree zsh-syntax-highlighting sd zoxide obsidian gh go python3 || { echo 'Failed brew installing something'; exit 1; }

# installs NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | zsh || { echo 'Failed installing nvm'; exit 1; }

# download and install Node.js
nvm install 22 || { echo 'Failed nvm installing node'; exit 1; }

# verifies the right Node.js version is in the environment
node -v # should print `v22.1.0`

# verifies the right NPM version is in the environment
npm -v # should print `10.7.0`

curl -L https://iterm2.com/downloads/stable/latest --output ~/Downloads/iTerm.zip || { echo 'Failed downloading iTerm2 with curl'; exit 1; }
unzip ~/Downloads/iTerm.zip -d ~/Applications/ || { echo 'Failed unzipping and installing iTerm2'; exit 1; }

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || { echo 'Failed installing omz'; exit 1; }
rm ~/.zshrc

git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout

omz reload

echo "Don't forget to set font-hack-nerd-font in terminal preferences"
