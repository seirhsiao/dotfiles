# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/xiao/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/xiao/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/xiao/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/xiao/.fzf/shell/key-bindings.zsh"

