# command prefix search with ctrl-p and ctrl-n
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# emacs keybindings
bindkey -e

bindkey '^p' up-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search

bindkey '^R' fzf-history-widget
bindkey '^V' fzf-variables-widget
