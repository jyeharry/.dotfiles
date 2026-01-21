# -------- ENV VARIABLES --------

export ICLOUD_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs"


# -------- SOURCES & 3RD PARTY TOOLS --------

# theme for fzf
sh ~/tokyonight.nvim/extras/fzf/tokyonight_night.sh


# -------- OPTIONS --------


# -------- ZINIT --------

zinit light mroth/evalcache


# -------- FUNCTIONS --------


# -------- KEY BINDS --------


# -------- ALIASES & COMMANDS --------


# -------- LOCAL CONFIGS --------

[[ -f ~/.local.zshrc ]] && source ~/.local.zshrc


#  -------- LAST --------

_evalcache fzf --zsh
_evalcache zoxide init zsh
_evalcache starship init zsh

