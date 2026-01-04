# -------- OMARCHY --------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load omarchy-zsh configuration
if [[ -d /usr/share/omarchy-zsh/conf.d ]]; then
  for config in /usr/share/omarchy-zsh/conf.d/*.zsh; do
    [[ -f "$config" ]] && source "$config"
  done
fi

# Load omarchy-zsh functions and aliases
if [[ -d /usr/share/omarchy-zsh/functions ]]; then
  for func in /usr/share/omarchy-zsh/functions/*.zsh; do
    [[ -f "$func" ]] && source "$func"
  done
fi

source ~/.dotfiles/.zsh/envs.zsh
source ~/.dotfiles/.zsh/sources.zsh
source ~/.dotfiles/.zsh/opts.zsh
source ~/.dotfiles/.zsh/funcs.zsh
source ~/.dotfiles/.zsh/binds.zsh
source ~/.dotfiles/.zsh/aliases.zsh
source ~/.dotfiles/.zsh/last.zsh
