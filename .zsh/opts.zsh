setopt autocd
setopt EXTENDED_HISTORY     # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when the shell exits.

setopt APPEND_HISTORY       # append to history file (Default)
setopt SHARE_HISTORY        # Share history between all sessions.
setopt HIST_IGNORE_DUPS     # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE    # Do not record an event starting with a space.
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks from each command line being added to the history.

setopt HIST_VERIFY          # Do not execute immediately upon history expansion.
setopt HIST_NO_STORE        # Don't store history commands
unsetopt LIST_BEEP

# Typing lowercase matches both lowercase AND uppercase.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Uses $LS_COLORS variable for file colors.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Shows completions as a simple list instead of a selectable menu.
zstyle ':completion:*' menu no
# When completing cd commands, shows a preview with ls of the directory.
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -lahFG --color $realpath'
# Shows directory previews for z (zoxide) commands.
zstyle ':fzf-tab:complete:__zoxide:*' fzf-preview 'ls -lahFG --color $realpath'
