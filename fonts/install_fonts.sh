#!/bin/bash
###############################################################################
#
# Name: install-fonts
#
# Author: Jianfang Xiao
#
# Contact: xiaojianfang558@gmail.com, http://www.seirhsiao.com
#
# License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html
#
# Usage:  Put script in a directory in your PATH e.g. /usr/bin
#   First Param: new fonts location, no trailing slash
#   Second Param: installed fonts location
#   e.g. /usr/local/share/fonts/myfonts
#
# Example:
#        install-fonts /home/steven/fontdl /usr/local/share/fonts/myfonts
#
###############################################################################

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../install/init/utils.sh"
DOTFILES_ROOT="${HOME}/.dotfiles"
#declare -r FONT_DIRECTORY="$CODE_DIRECTORY/fonts"

if test "$(uname)" = "Darwin" ; then
  # MacOS
  FONT_DIR="$HOME/Library/Fonts"
else
  # Linux
  FONT_DIR="$HOME/.local/share/fonts"
  mkdir -p $FONT_DIR
fi

clone_fonts() {
  GIT_FONT_URL=$1
  git clone --quiet ${GIT_FONT_URL} "${FONT_DIR}"
  print_result $? "Download"
}

install_fonts() {
  pushd "${FONT_DIR}" &> /dev/null && \
    ./install.sh && \
    popd &> /dev/null

  print_result $? "Install"
}

install_fonts_from_dotfilles() {
  print_in_yellow "Would you like to install fonts for specific use cases with your editor and terminal (Powerline & Fira)?\n\
       [y]es, [N]o"
  read -n 1 action

  case "$action" in
    y )
        install_fonts=true;;
    * )
        ;;
  esac

  if [ "$install_fonts" == "true" ] ; then
    print_info 'Installing Fonts from dotfile'
    find "${DOTFILES_ROOT}/home/fonts" \( -name "*.[ot]tf" \) -type f -print0 | xargs -0 -n1 -I % cp "%" "${FONT_DIR}/"
    print_success "Fonts Installed at ${FONT_DIR}"
  fi
}

install_powerline_fonts() {
    echo "Installing Powerline fonts"
    POWERLINE_GIT="https://github.com/powerline/fonts"
    git clone $POWERLINE_GIT --depth=1 powerline-fonts
    sh ./powerline-fonts/install.sh
    rm -rf powerline-fonts
}

install_inter_ui_fonts() {
  echo "Installing Inter UI fonts"
  INTER_UI_URL="https://github.com/rsms/inter/releases/download/v2.5/Inter-UI-2.5.zip"
  curl -L $INTER_UI_URL > inter-ui.zip
  unzip inter-ui.zip -d inter-ui
  mv inter-ui/Inter\ UI\ \(OTF\) "${FONT_DIR}/"
  rm -rf inter-ui inter-ui.zip
}

install_nerd_fonts () {
  echo "Installing Nerd fonts"
  if test "$(uname)" = "Darwin" ; then
    # MacOS
    brew tap caskroom/fonts
    brew cask install font-hack-nerd-font
    # cd ${FONT_DIR} && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
  else
    # Linux
    cd "${FONT_DIR}/" && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
  fi
}

main() {
  print_info "Installing fonts"

  # if [ ! -d "${FONT_DIR}/" ]; then
  #   mkdir -p "${FONT_DIR}/"
  #   clone_fonts
  # fi
  install_fonts_from_dotfilles
  install_nerd_fonts
  install_powerline_fonts
  # install_fonts
}

main
