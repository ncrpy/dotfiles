export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export ZDOTDIR="${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}"
export HISTFILE="$ZDOTDIR/.zsh_history"
source "$ZDOTDIR/.zshenv"
