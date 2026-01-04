autoload -Uz compinit
# cache compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit -i -C
else
  compinit -i
fi

# bun completions
# [ -s "/Users/jye.harry/.bun/_bun" ] && source "/Users/jye.harry/.bun/_bun"

# fzf git shortcuts
source ~/.dotfiles/scripts/fzf-git/fzf-git.sh

# theme for fzf
# source ~/.dotfiles/tokyonight.nvim/extras/fzf/tokyonight_night.sh

# Install zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light Aloxaf/fzf-tab
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
