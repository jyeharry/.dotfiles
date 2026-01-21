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

function mkcd takedir() {
  mkdir -p $@ && cd ${@:$#}
}

fzf-variables-widget() {
  local current_token="${LBUFFER##* }"
  local cleaned_token="${current_token#\$}"

  local selected
  selected=$(typeset -p | awk '{print $1, $2}' | sort -u | awk '{print $2}' | \
    fzf --multi --prompt="Variables> " --preview-window=wrap \
      --preview='echo {} && typeset -p {} 2>/dev/null || echo "No details available"' \
      --query="$cleaned_token")

  if [[ -n "$selected" ]]; then
    # If current token starts with $, keep the $
    if [[ "$current_token" == \$* ]]; then
      selected="\$${selected}"
    fi
    # Replace the current token
    LBUFFER="${LBUFFER%$current_token}${selected} "
  fi
  zle reset-prompt
}
zle -N fzf-variables-widget
