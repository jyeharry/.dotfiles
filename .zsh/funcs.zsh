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
