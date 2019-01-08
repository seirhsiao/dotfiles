#!/bin/zsh
# -*- mode:sh; coding:utf-8 -*-
###############################################################################
#                     __                                     __
#              ____  / /_     ____ ___  __  __   ____  _____/ /_
#             / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \
#            / /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / /
#            \____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/
#                                   /____/
###############################################################################
# Resources:
# - https://github.com/smaximov/zsh-config
# - https://github.com/Falkor/dotfiles
#
# You SHOULD have made `~/.zshenv` a symbolic link pointing to
# `$ZDOTDIR/.zshenv` as follow:
#
#           ln -s .config/zsh/.zshenv ~/.zshenv
#
# This ensure all expected environment variable (in particular the ones of
# XDG Base Directory Specification (see https://specifications.freedesktop.org/basedir-spec/latest/)
# are set
###############################################################################
export ZSH=$HOME/.oh-my-zsh
## Update / check ZSH config
# Courtesy https://github.com/smaximov/zsh-config/blob/master/lib/functions.zsh
update-zsh-config() {
   upgrade_oh_my_zsh
}

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

is_program_exists() {
  if type "$1" &>/dev/null; then
    return 0
  else
    return 1
  fi
}

is_custom_plugin_exists() {
  local plugin=$1
  if [ -d $ZSH/custom/plugins/$plugin ] && [ -e $ZSH/custom/plugins/$plugin/$plugin.plugin.zsh ]; then
    return 0
  else
    return 1
  fi
}
# update-zsh-config() {
#     env ZSH=$ZSH $ZDOTDIR/tools/update-zsh-config.sh "$@"
# }
################## Oh-My-ZSH (optional) customizations ########################
#
# === Oh-My-ZSH Prompt Theme ===
# - Default themes:'$ZSH/themes/*' i.e. ~/.local/share/oh-my-zsh/themes/*
# - Custom themes: '$ZSH_CUSTOM/themes/*' i.e. ~/config/zsh/custom/themes/*

#----------------------------------------------------------------------------#
#                         Oh My Zsh configuration
#----------------------------------------------------------------------------#
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell" agnoster-zsh-theme
# ZSH_THEME="dallas"
# ZSH_THEME="avit"
# ZSH_THEME="miloshadzic"
# ZSH_THEME="ys"
# ZSH_THEME="agnoster"
# ZSH_THEME="zeta"
ZSH_THEME="powerlevel9k/powerlevel9k" ## powerlevel9k location at custom and link to theme
# ZSH_THEME="random"
# ZSH_THEME_RANDOM_CANDIDATES=(
#   "powerlevel9k/powerlevel9k"
#   "agnoster"
# )
#
# Show OS info when opening a new terminal
neofetch

if [[ -f ${ZSH_HOME}/powerlevel9k ]]; then
     source ${ZSH_HOME}/powerlevel9k
fi


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


##############################################################################
#
# === Oh-My-ZSH Plugins ===
plugins=()
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# set default zsh plugins
# - Default plugins: '$ZSH/plugins/*' i.e. ~/.local/share/oh-my-zsh/plugins/*
plugins=(
  $plugins
  colored-man-pages
  command-not-found
  encode64
  extract
  fzf-zsh
  sublime
  sudo
  # zsh_reload
  # compleat
  history
  history-substring-search
  zsh-history-substring-search
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-syntax-highlighting-filetypes
)

# Add them wisely, as too many plugins slow down shell startup.
#___________________

#   See https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
# plugins+=(rake gem)                     # Ruby stuff
# plugins+=(pyenv pip)                    # Python stuff
# plugins+=(node npm)                     # Nodejs Npm
# plugins+=(docker docker-compose)        # Docker stuff
# plugins+=(ruby rvm rails gem)           # ruby rvm rails
# plugins+=(kubectl minikube)             # Kubernetes stuff

# [[ "$(uname)" == "Darwin" ]] && plugins+=(osx brew)        # Mac OS

# Misc
# plugins+=(colored-man-page cp marked2 taskwarrior)
#__________________

# - Custom plugins: '$ZSH_CUSTOM/plugins/*' i.e. ~/config./zsh/custom/plugins/
#
# plugins+=(falkor zsh-completions)
# if we have fasd or autojump installed, add fasd plugin
# otherwise use z plugin
if ( is_program_exists fasd ); then
  plugins=(
    $plugins
    fasd
  )
else
  plugins=(
    $plugins
    z
  )
fi

# if we have git installed, add git plugin
if ( is_program_exists git ); then
  plugins=(
    $plugins
    gitfast
  )

  # only enable git-extras when we have installed git-extras
  if ( is_program_exists git-extras ); then
    plugins=(
      $plugins
      git-extras
    )
  fi;

  # only enable git-flow-completion when we have installed git-flow-avh
  # don't use oh-my-zsh included git-flow or git-flow-avh
  if ( is_program_exists git-flow ) && ( is_custom_plugin_exists git-flow-completion ); then
    plugins=(
      $plugins
      git-flow-completion
    )
  fi;
fi;

# if we have httpie installed, add httpie plugin
if ( is_program_exists http ); then
  plugins=(
    $plugins
    httpie
  )
fi;

# if we have mosh installed, add mosh plugin
if ( is_program_exists mosh ); then
  plugins=(
    $plugins
    mosh
  )
fi;

# if we have thefuck installed, add thefuck plugin
if ( is_program_exists thefuck ); then
  plugins=(
    $plugins
    thefuck
  )
fi;

# if we have tmux installed, add tmux plugin
if ( is_program_exists tmux ); then
  plugins=(
    $plugins
    tmux
  )
fi;

# if we are in osx, add osx only plugins
if [[ "$OSTYPE" == "darwin"* ]]; then
  plugins=(
    $plugins
    osx
    brew
  )
fi;

# if we have maven installed, add mvn plugin
if ( is_program_exists mvn ); then
  plugins=(
    $plugins
    mvn
  )
fi;

# if we have gradle installed, add gradle plugin
if ( is_program_exists mvn ); then
  plugins=(
    $plugins
    gradle
  )
fi;

#_______________________________________
# [Final] Custom Oh-my-ZSH configuration
# (for instance to change the plugins/themes set by Falkor's dotfiles)
[[ -f $ZDOTDIR/custom.zshrc ]] && source $ZDOTDIR/custom.zshrc
##############################################################################
#
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

## zsh-syntax-highlighting
# Install by Manual Method
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Incremental completion on zsh -- need to before on my zsh
## http://mimosa-pudica.net/zsh-incremental.html
# source ${ZSH}/plugins/incr/incr-0.2.zsh

# only init zsh-autosuggestions when we not in emacs terms, because terms in
# emacs will not render zsh-autosuggestions gray color correctyly
# if [[ "$INSIDE_EMACS" == "" ]]; then
#   plugins=(
#     $plugins
#     zsh-autosuggestions
#   )
# fi

# Syntax highlighting and tab completion for manual method
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## source $ZSH/oh-my-zsh.sh
[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh