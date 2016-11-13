#!/bin/bash

FONTS_DIR="$HOME/.fonts"
GTK_FONT_SIZE=10

mkdir -v ${FONTS_DIR}

cd ${HOME}/Downloads

# donwload and install FontAwesome
wget https://github.com/FortAwesome/Font-Awesome/tree/master/fonts/fontawesome-webfont.ttf
cp -rv ${HOME}/Downloads/fontawesome-webfont.ttf ${FONTS_DIR}

# download and install Yosemite System Display fonts
wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip
unzip master.zip
cp -rv ${HOME}/Downloads/YosemiteSanFranciscoFont-master/*.ttf ${FONTS_DIR}

# install lxappearance
sudo apt-get -y install lxappearance

# cleanup Downloads folder
rm -rf ${HOME}/Downloads/YosemiteSanFrancisco* master.zip fontawesome-webfont*

cat << EOF > ${HOME}/.gtkrc-2.0
# DO NOT EDIT! This file will be overwritten by LXAppearance.
# Any customization should be done in ~/.gtkrc-2.0.mine instead.
gtk-theme-name="Raleigh"
gtk-icon-theme-name="hicolor"
gtk-font-name="System San Francisco Display ${GTK_FONT_SIZE}"
gtk-cursor-theme-name="DMZ-White"
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="hintslight"
gtk-xft-rgba="rgb"
include "${HOME}/.gtkrc-2.0.mine"
EOF

# update gtk-3.0/settings.ini file
sed -i -e "s/Sans 11/System San Francisco Display ${GTK_FONT_SIZE}/" $HOME/.config/gtk-3.0/settings.ini

# NOTES-----
# change .i3/config --> font pango:System San Francisco Display 10
# install infanality [OPTIONAL]
