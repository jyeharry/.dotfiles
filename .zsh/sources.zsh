# fzf git shortcuts
source ~/scripts/fzf-git/fzf-git.sh

# theme for fzf
# source ~/tokyonight.nvim/extras/fzf/tokyonight_night.sh

# Install zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


zinit wait lucid for \
  Aloxaf/fzf-tab \
  OMZL::key-bindings.zsh \
  OMZL::git.zsh \
  OMZP::rails \
  OMZP::git

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
  zsh-users/zsh-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
  zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
  zsh-users/zsh-completions
