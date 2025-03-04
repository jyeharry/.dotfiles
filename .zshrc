# -------- ENV VARIABLES --------

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export LS_COLORS="di=1;34:ln=1;36:so=1;31:pi=1;33:ex=1;32:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43"
export FZF_PREVIEW_BIND_OPTS='--bind=ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up'
export FZF_DEFAULT_OPTS='--bind change:first'
export LG_CONFIG_FILE="$HOME/tokyonight.nvim/extras/lazygit/tokyonight_night.yml,$HOME/.config/lazygit/config.yml"

# nvim
export EDITOR='nvim'
export NVD="$HOME/.config/nvim/"
export NVIMRC="$NVD/init.lua"

export SOLARGRAPH_GLOBAL_CONFIG="$NVD/config/lsps/solargraph-config.yml"

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export ANDROID_SDK_HOME=$HOME/.android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/bin/

export PATH=$PATH:$HOME/.rbenv/bin
export PATH="/Users/jye.harry/.rbenv/shims:${PATH}"
export RBENV_SHELL=zsh

# fzf's command
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules'"
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

export fpath=(~/.zsh.d/ $fpath)
export HISTFILE=~/.zsh_history
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTORY_IGNORE="(ls|cd|pwd|exit|cd|history).*"
export HIST_STAMPS="yyyy-mm-dd"


# -------- SOURCES & 3RD PARTY TOOLS --------

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# bun completions
[ -s "/Users/jye.harry/.bun/_bun" ] && source "/Users/jye.harry/.bun/_bun"

# fzf git shortcuts
source ~/scripts/fzf-git/fzf-git.sh

# theme for fzf
sh ~/tokyonight.nvim/extras/fzf/tokyonight_night.sh

# fnm
FNM_PATH="/Users/jyeharry/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/jyeharry/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi


# -------- OPTIONS --------

setopt EXTENDED_HISTORY     # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY        # Share history between all sessions.
setopt HIST_IGNORE_DUPS     # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE    # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS    # Do not write a duplicate event to the history file.
setopt HIST_VERIFY          # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY       # append to history file (Default)
setopt HIST_NO_STORE        # Don't store history commands
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks from each command line being added to the history.


# -------- EVALS --------

eval "$(fzf --zsh)"
eval "$(rbenv init - --rehash zsh 2>/dev/null)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"


# -------- ZINIT --------

# zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# zinit snippets
zinit snippet OMZP::git
zinit snippet OMZP::fzf
zinit snippet OMZP::rails
zinit snippet OMZL::git.zsh

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -lahFG --color $realpath'
zstyle ':fzf-tab:complete:__zoxide:*' fzf-preview 'ls -lahFG --color $realpath'

# load completions
autoload -U compinit && compinit


# -------- FUNCTIONS --------

_rails_command() {
  if [[ -f ./bin/rails ]]; then
    ./bin/rails "$@"
  else
    command rails "$@"
  fi
}

_rake_command() {
  if [[ -f ./bin/rake ]]; then
    ./bin/rake "$@"
  else
    command rake "$@"
  fi
}

fzf-man-widget() {
  batman="man {1} | col -bx | bat --language=man --plain --color always --theme=\"Monokai Extended\""
  man -k . | sd '\(\d+\)' '' | sort |
    awk -v cyan=$(tput setaf 6) -v blue=$(tput setaf 4) -v res=$(tput sgr0) -v bld=$(tput bold) '{ $1=cyan bld $1; $2=res blue;} 1' |
    fzf \
    -q "$1" \
    --ansi \
    --tiebreak=begin \
    --prompt=' Man > ' \
    --preview-window 'wrap,50%,rounded,<50(up,85%,border-bottom)' \
    --preview "${batman}" \
    --bind "enter:execute(man {1})" \
    --bind "alt-c:+change-preview(cht.sh {1})+change-prompt(ﯽ Cheat > )" \
    --bind "alt-m:+change-preview(${batman})+change-prompt( Man > )" \
    --bind "alt-t:+change-preview(tldr --color=always {1})+change-prompt(ﳁ TLDR > )" \
    $FZF_PREVIEW_BIND_OPTS
    zle reset-prompt
}

# fkill - kill processes - list only the ones you can kill.
fkill() {
  local pid
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  fi

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}

command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
    rehash | shell)
      eval "$(rbenv "sh-$command" "$@")"
      ;;
    *)
      command rbenv "$command" "$@"
      ;;
  esac
}

_fzf_git_fzf() {
  fzf --height=100% --tmux 90%,70% \
    --layout=reverse --multi --min-height=20 --border \
    --border-label-pos=2 \
    --color='header:italic:underline,label:blue' \
    --preview-window='right,50%,border-left' \
    --bind='ctrl-/:change-preview-window(down,50%,border-top|hidden|)' "$@"
}

# for more info see fzf/shell/completion.zsh
_fzf_compgen_path() {
  fd . "$1"
}

_fzf_compgen_dir() {
  fd --type d . "$1"
}


# -------- KEY BINDS --------

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# `Ctrl-H` keybinding to launch the widget (this widget works only on zsh, don't know how to do it on bash and fish (additionaly pressing`ctrl-backspace` will trigger the widget to be executed too because both share the same keycode)
bindkey '^h' fzf-man-widget
zle -N fzf-man-widget


# -------- ALIASES & COMMANDS --------

rails=_rails_command
rake=_rake_command

unalias sd

# general aliases
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias .='pwd'
alias alrg='print -z -- $(alias | fzf | sd "=.*$" "")'
alias cht='cht.sh'
alias lg='lazygit'
alias ll='ls -lahFG'
alias myzshrc='nvim ~/.myzshrc && omz reload'
alias sb='supabase'
alias simboot='xcrun simctl boot'
alias simlist='xcrun simctl list devices | nvim -R'
alias simshut='xcrun simctl shutdown'
alias zshrc='nvim ~/.zshrc && omz reload'

# git aliases
alias df="dotfiles"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias gcm='git commit -m'
alias gcmnv='git commit --no-verify -m'
alias gfh='git log --pretty=format:"%C(auto)%H %an %ad, (%ar)" --date=format-local:%d/%m/%Y --name-status'
alias grget='git remote get-url --all'
alias gs='git status'
# show changes from develop to current branch
alias gshbr="git show develop..$(git_current_branch) 2>/dev/null git show main..$(git_current_branch)"
alias gurl="git config --get remote.origin.url | sd ':' '/' | sd 'git@' 'https://'"
alias gweb="open $(gurl)"
alias main='git checkout main || git checkout master'
alias dev='git checkout develop || main'

alias nvd="cd $NVD"
alias nvimrc="cd $NVD && nvim $NVIMRC && cd -"


# -------- LOCAL CONFIGS --------

[[ -f ~/.local.zshrc ]] && source ~/.local.zshrc

