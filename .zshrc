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

source ~/.zsh/envs.zsh
source ~/.zsh/sources.zsh
source ~/.zsh/opts.zsh
source ~/.zsh/funcs.zsh
source ~/.zsh/binds.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/last.zsh
[[ -f ~/.zsh/local.zsh ]] && source ~/.zsh/local.zsh
if [[ ! -d /usr/share/omarchy-zsh/conf.d ]]; then
  source ~/.zsh/mac.zsh
fi
