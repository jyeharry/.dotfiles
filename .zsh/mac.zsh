# -------- ENV VARIABLES --------

export ICLOUD_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

# Created by `pipx` on 2025-06-13 11:11:01
export PATH="$PATH:/Users/jyeharry/Library/Python/3.11/bin"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
fi


# -------- SOURCES & 3RD PARTY TOOLS --------

# bun completions
[ -s "/Users/jye.harry/.bun/_bun" ] && source "/Users/jye.harry/.bun/_bun"

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

# fnm
if [ -d "$FNM_PATH" ]; then
  _evalcache fnm env --use-on-cd --version-file-strategy=recursive --shell zsh
fi

_evalcache fzf --zsh
_evalcache zoxide init zsh
_evalcache starship init zsh

autoload -Uz compinit
# cache compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit -i -C
else
  compinit -i
fi

if command -v pipx &> /dev/null; then
    _evalcache register-python-argcomplete pipx
fi
