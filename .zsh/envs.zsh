export EDITOR='nvim'
export SUDO_EDITOR="$EDITOR"

export LS_COLORS="di=1;34:ln=1;36:so=1;31:pi=1;33:ex=1;32:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43"
export LG_CONFIG_FILE="$HOME/.dotfiles/tokyonight.nvim/extras/lazygit/tokyonight_night.yml,$HOME/.config/lazygit/config.yml"

# nvim
export NVD="$HOME/.config/nvim/"
export NVIMRC="$NVD/init.lua"

export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/bin/

export MANPAGER='nvim +Man!'

# export WORDCHARS=''

# fzf's command
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules'"
export FZF_PREVIEW_BIND_OPTS='--bind=ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind change:first"
# CTRL-T's command
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
--height 100%
--preview-window wrap,down,75%
--preview '[[ -d {} ]] && tree -FC --gitignore {} || bat -n --color=always {}'
--header 'CTRL-Y (copy selection)\n'
--bind 'ctrl-y:execute-silent(pbcopy <<< {})+abort'
$FZF_PREVIEW_BIND_OPTS
"
# ALT-C's command
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

export HISTFILE=~/.zsh_history
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTORY_IGNORE="(ls|cd|pwd|exit|cd|history).*"
export HIST_STAMPS="yyyy-mm-dd"

export HELPDIR=/usr/share/zsh/5.9/help/
