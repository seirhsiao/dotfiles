
#!/bin/zsh
# -*- coding:utf-8 -*-
# set -xe
## HOME = ~
if [[ ! $HOME ]];then
  HOME=$(env | grep ^HOME=)
fi

# tmux_automatically_attach attachs tmux session
# automatically when your are in zsh
if [[ -x ${HOME}/bin/tmuxx ]]; then
    ${HOME}/bin/tmuxx
fi

## Check if zplug is installed

# [ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
# source ~/.zplug/init.zsh

if [[ ! -d "${ZPLUG_HOME}" ]]; then
  if [[ ! -d ${HOME}/.zplug ]]; then
    git clone https://github.com/zplug/zplug ${HOME}/.zplug
    # If we can't get zplug, it'll be a very sobering shell experience. To at
    # least complete the sourcing of this file, we'll define an always-false
    # returning zplug function.
    if [[ $? != 0 ]]; then
      function zplug() {
        return 1
      }
    fi
  fi
  export ZPLUG_HOME=${HOME}/.zplug
else
  ## check if download zplug success
  if [[ -f "${ZPLUG_HOME}"/init.zsh ]]; then
    source "${ZPLUG_HOME}/init.zsh"
  fi
fi

# zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# zplug "~/.zsh", from:local, use:"<->_*.zsh"

# oh-my-zsh
# zplug "zplug/zplug"
# zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

# Miscellaneous commands
# zplug "k4rthik/git-cal",  as:command
# zplug "peco/peco",        as:command, from:gh-r
# zplug "andrewferrier/fzf-z"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, \
  frozen:1, use:"*${(L)$(uname -s)}*amd64*"
zplug "junegunn/fzf", use:"shell/*.zsh", as:plugin

# zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Enhanced cd
# zplug "b4b4r07/enhancd", use:init.sh
# zplug "b4b4r07/git-open", as:command, at:patch-1
# zplug "b4b4r07/open-link.sh", as:command, use:'(*).bash', rename-to:'$1'
# zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi
# zplug "b4b4r07/ssh-keyreg", as:command, use:bin
# zplug "mrowa44/emojify", as:command
# zplug 'b4b4r07/copy', as:command, use:'(*).sh', rename-to:'$1'
# zplug "b4b4r07/ultimate", as:theme
# if zplug check "b4b4r07/ultimate"; then
#     zstyle ':ultimate:prompt:path' mode 'shortpath'
# fi
# source /Users/b4b4r07/src/github.com/b4b4r07/ultimate/ultimate.zsh-theme

# zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# zplug 'b4b4r07/zplug-doctor', lazy:yes
# zplug 'b4b4r07/zplug-cd', lazy:yes
# zplug 'b4b4r07/zplug-rm', lazy:yes

# zplug 'b4b4r07/tmux-powertools', \
#     hook-load:'tmux-loader'

#zplug 'b4b4r07/git-powertools', \
#    as:command, \
#    use:'bin/*'

# zplug 'b4b4r07/zls', lazy:yes
# zplug 'b4b4r07/fpath-editor', lazy:yes

# zplug 'andialbrecht/sqlparse', \
#     as:command, \
#     hook-build:'python setup.py install'

# zplug 'dtan4/ghrls', \
#     as:command, \
#     hook-build:'go get -d && go build'

# zplug 'tianon/gosleep', \
#     as:command, \
#     hook-build:'go get -d ./src/gosleep/... && go build ./src/gosleep/...'

# zplug 'b4b4r07/fzf-powertools', \
#     as:command, \
#     use:'re'

#zplug 'b4b4r07/git-switch', \
#    as:command, \
#    use:'(*).sh', \
#    rename-to:'$1'

# zplug 'mutantcornholio/prok', \
#     as:command, \
#     use:'(*).sh', \
#     rename-to:'$1'

# zplug 'b4b4r07/ltsv.sh', \
#     as:command, \
#     use:'(ltsv).sh', \
#     rename-to:'$1'

# zplug 'b4b4r07/git-fzf', hook-build:'make'
# zplug 'b4b4r07/git-fzf', \
#     as:command, \
#     use:'bin/(git-*).zsh', \
#     rename-to:'$1'

# zplug 'b4b4r07/dbl', \
#     as:command, \
#     use:'(dbl).zsh', \
#     rename-to:'$1'

# zplug 'b4b4r07/kubernetes-alias', use:zshrc

# zplug 'b4b4r07/history', use:misc/zsh/init.zsh
# if zplug check 'b4b4r07/history'; then
#     export ZSH_HISTORY_AUTO_SYNC=false
# fi

# #zplug 'b4b4r07/zsh-history', defer:3, use:init.zsh
# zplug 'b4b4r07/zsh-history', as:command, use:misc/fzf-wrapper.zsh, rename-to:ff
# if zplug check 'b4b4r07/zsh-history'; then
#     export ZSH_HISTORY_FILE="$HOME/.zsh_history.db"
#     ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
#     ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
#     ZSH_HISTORY_KEYBIND_SCREEN="^r^r"
#     ZSH_HISTORY_KEYBIND_ARROW_UP="^p"
#     ZSH_HISTORY_KEYBIND_ARROW_DOWN="^n"
# fi

# Bookmarks and jump
# zplug "jocelynmallon/zshmarks"

# Enhanced dir list with git features
# zplug "supercrabtree/k"

# Jump back to parent directory
# zplug "tarrasch/zsh-bd"

# Simple zsh calculator
# zplug "arzzen/calc.plugin.zsh"

# Directory colors
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin

# =============================================================================
#                                   Theme
# =============================================================================
# Using branch 'next' introduces a color regression, so we fall back to master
# ofr now. See https://github.com/bhilburn/powerlevel9k/pull/703 for details.
# zplug 'bhilburn/powerlevel9k', use:powerlevel9k.zsh-theme, at:next
# Load theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# =============================================================================
#                                   Plugins
# =============================================================================

zplug "plugins/common-aliases",    from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
#zplug "plugins/colorize",         from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/copydir",           from:oh-my-zsh
zplug "plugins/copyfile",          from:oh-my-zsh
zplug "plugins/cp",                from:oh-my-zsh
zplug "plugins/dircycle",          from:oh-my-zsh
zplug "plugins/encode64",          from:oh-my-zsh
zplug "plugins/extract",           from:oh-my-zsh
zplug 'plugins/fancy-ctrl-z',      from:oh-my-zsh
# zplug 'plugins/httpie',            from:oh-my-zsh, if:'which httpie'
zplug "plugins/history",           from:oh-my-zsh
# zplug "plugins/tmux",              from:oh-my-zsh
# zplug 'plugins/tmux',              from:oh-my-zsh, if:'which tmux'
# zplug "plugins/tmuxinator",        from:oh-my-zsh
zplug "plugins/urltools",          from:oh-my-zsh
zplug "plugins/web-search",        from:oh-my-zsh
zplug "plugins/z",                 from:oh-my-zsh



# Supports oh-my-zsh plugins and the like
if [[ $OSTYPE = (linux)* ]]; then
    zplug "plugins/archlinux",     from:oh-my-zsh, if:"(( $+commands[pacman] ))"
    zplug "plugins/dnf",           from:oh-my-zsh, if:"(( $+commands[dnf] ))"
fi

if [[ $OSTYPE = (darwin)* ]]; then
    zplug "lib/clipboard",         from:oh-my-zsh
    zplug "plugins/osx",           from:oh-my-zsh
    zplug "plugins/brew",          from:oh-my-zsh, if:"(( $+commands[brew] ))"
    zplug "plugins/macports",      from:oh-my-zsh, if:"(( $+commands[port] ))"
fi

# zplug 'plugins/git', from:oh-my-zsh, if:'which git'
zplug "plugins/git",               from:oh-my-zsh, if:"(( $+commands[git] ))"
# zplug "plugins/golang",            from:oh-my-zsh, if:"(( $+commands[go] ))"
zplug "plugins/svn",               from:oh-my-zsh, if:"(( $+commands[svn] ))"
zplug "plugins/node",              from:oh-my-zsh, if:"(( $+commands[node] ))"
zplug "plugins/npm",               from:oh-my-zsh, if:"(( $+commands[npm] ))"
# zplug 'plugins/nanoc',             from:oh-my-zsh, if:'which nanoc'
# zplug 'plugins/nmap',              from:oh-my-zsh, if:'which nmap'

# zplug 'plugins/bundler', from:oh-my-zsh, if:'which bundle'
zplug "plugins/bundler",           from:oh-my-zsh, if:"(( $+commands[bundler] ))"
zplug "plugins/gem",               from:oh-my-zsh, if:"(( $+commands[gem] ))"
# zplug "plugins/rbenv",             from:oh-my-zsh, if:"(( $+commands[rbenv] ))"
# zplug "plugins/rvm",               from:oh-my-zsh, if:"(( $+commands[rvm] ))"
zplug "plugins/pip",               from:oh-my-zsh, if:"(( $+commands[pip] ))"
zplug "plugins/sudo",              from:oh-my-zsh, if:"(( $+commands[sudo] ))"
# zplug 'plugins/gpg-agent',       from:oh-my-zsh, if:'which gpg-agent'
# zplug "plugins/gpg-agent",         from:oh-my-zsh, if:"(( $+commands[gpg-agent] ))"
# zplug "plugins/systemd",           from:oh-my-zsh, if:"(( $+commands[systemctl] ))"
# zplug "plugins/docker",            from:oh-my-zsh, if:"(( $+commands[docker] ))"
# zplug "plugins/docker-compose",    from:oh-my-zsh, if:"(( $+commands[docker-compose] ))"

#zplug "djui/alias-tips"
# zplug "hlissner/zsh-autopair", defer:2
# zplug "zsh-users/zsh-completions", defer:2
# zplug "zsh-users/zsh-autosuggestions", defer:2
# zsh-syntax-highlighting must be loaded after executing compinit command
# and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3


if zplug check 'seebi/dircolors-solarized'; then
  if which gdircolors > /dev/null 2>&1; then
    alias dircolors='gdircolors'
  fi
  if which dircolors > /dev/null 2>&1; then
    scheme='dircolors.256dark'
    eval $(dircolors $ZPLUG_HOME/repos/seebi/dircolors-solarized/$scheme)
  fi
fi


if zplug check "b4b4r07/enhancd"; then
  ENHANCD_DOT_SHOW_FULLPATH=1
  ENHANCD_DISABLE_HOME=0
fi

# zplug "b4b4r07/ultimate", as:theme
if zplug check "b4b4r07/ultimate"; then
    zstyle ':ultimate:prompt:path' mode 'shortpath'
fi

if zplug check "b4b4r07/zsh-history-enhanced"; then
  ZSH_HISTORY_FILE="$HISTFILE"
  ZSH_HISTORY_FILTER="fzf:peco:percol"
  ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
  ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
  ZSH_HISTORY_KEYBIND_SCREEN="^r^r"
  ZSH_HISTORY_KEYBIND_ARROW_UP="^p"
  ZSH_HISTORY_KEYBIND_ARROW_DOWN="^n"
fi

if zplug check 'zsh-users/zsh-autosuggestions'; then
  # Enable asynchronous fetching of suggestions.
  ZSH_AUTOSUGGEST_USE_ASYNC=1
  # For some reason, the offered completion winds up having the same color as
  # the terminal background color (when using a dark profile). Therefore, we
  # switch to gray.
  # See https://github.com/zsh-users/zsh-autosuggestions/issues/182.
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=gray'
fi

if zplug check "bhilburn/powerlevel9k"; then
    # Easily switch primary foreground/background colors
    source ${ZSH_HOME}/powerlevel9k
fi


## zsh-syntax-highlighting
if zplug check "zsh-users/zsh-syntax-highlighting"; then
  #ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line)
  ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

  typeset -A ZSH_HIGHLIGHT_STYLES
  ZSH_HIGHLIGHT_STYLES[cursor]='bg=yellow'
  ZSH_HIGHLIGHT_STYLES[globbing]='none'
  ZSH_HIGHLIGHT_STYLES[path]='fg=white'
# ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
  ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=grey'
# ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[command]='fg=green'
  ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
  ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
  ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
  ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
  ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
  ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
  ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
fi

# FZF
if zplug check 'junegunn/fzf'; then
  export FZF_DEFAULT_OPTS='--height 30%
      --color fg:223,bg:235,hl:208,fg+:229,bg+:237,hl+:167,border:237
      --color info:246,prompt:214,pointer:214,marker:142,spinner:246,header:214'
fi

## Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose