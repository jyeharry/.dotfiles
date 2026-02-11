# -------- ALIASES & COMMANDS --------

rails=_rails_command
rake=_rake_command

if alias -v sd &> /dev/null; then
  unalias sd
fi

# general aliases
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias .='pwd'
alias -- -='cd -'
alias icloud="cd '$ICLOUD_DIR'"
alias alrg='print -z -- $(alias | fzf | sd "=.*$" "")'
alias cht='cht.sh'
alias ld='lazydocker'
alias lg='lazygit'
if alias -v ls &> /dev/null; then
  unalias ls
fi
if command -v eza &> /dev/null; then
  alias ll='eza -lha --group-directories-first --icons=auto'
else
  alias ll='ls -lahFG'
fi
alias oc='opencode'
alias sb='supabase'
alias simboot='xcrun simctl boot'
alias simlist='xcrun simctl list devices | nvim -R'
alias simshut='xcrun simctl shutdown'
alias zrc='nvim ~/.zshrc && exec zsh'
alias lzrc='nvim ~/.local.zshrc && exec zsh'

# git aliases
alias df="dotfiles"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias gcm='git commit -m'
alias gcmnv='git commit --no-verify -m'
alias grget='git remote get-url --all' # get url for remote
alias gs='git status'
# if command -v pbcopy &> /dev/null; then
#   alias gurl="git config --get remote.origin.url | sd ':' '/' | sd 'git@' 'https://' | pbcopy" # copy http url for current branch
#   alias gweb="open $(gurl)"
# fi
alias main='git checkout main || git checkout master'
alias dev='git checkout develop || main'
alias grsp='git restore --patch'
alias ghpc='gh pr create'
alias ghpv='gh pr view --web'

alias nvd="cd $NVD"
alias nvimrc="cd $NVD && nvim $NVIMRC && cd -"

alias rtc="rails test:controllers"

unalias run-help
autoload -Uz run-help
