#!/bin/bash

ROOT_UID=0

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  AURORAE_DIR="/usr/share/aurorae/themes"
  SCHEMES_DIR="/usr/share/color-schemes"
  PLASMA_DIR="/usr/share/plasma/desktoptheme"
  LAYOUT_DIR="/usr/share/plasma/layout-templates"
  LOOKFEEL_DIR="/usr/share/plasma/look-and-feel"
  KVANTUM_DIR="/usr/share/Kvantum"
  WALLPAPER_DIR="/usr/share/wallpapers"
else
  AURORAE_DIR="$HOME/.local/share/aurorae/themes"
  SCHEMES_DIR="$HOME/.local/share/color-schemes"
  PLASMA_DIR="$HOME/.local/share/plasma/desktoptheme"
  LAYOUT_DIR="$HOME/.local/share/plasma/layout-templates"
  LOOKFEEL_DIR="$HOME/.local/share/plasma/look-and-feel"
  KVANTUM_DIR="$HOME/.config/Kvantum"
  WALLPAPER_DIR="$HOME/.local/share/wallpapers"
fi

SRC_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=McMojave
COLOR_VARIANTS=('' '-light')

[[ ! -d ${AURORAE_DIR} ]] && mkdir -p ${AURORAE_DIR}
[[ ! -d ${SCHEMES_DIR} ]] && mkdir -p ${SCHEMES_DIR}
[[ ! -d ${PLASMA_DIR} ]] && mkdir -p ${PLASMA_DIR}
[[ ! -d ${LOOKFEEL_DIR} ]] && mkdir -p ${LOOKFEEL_DIR}
[[ ! -d ${KVANTUM_DIR} ]] && mkdir -p ${KVANTUM_DIR}
[[ ! -d ${WALLPAPER_DIR} ]] && mkdir -p ${WALLPAPER_DIR}
[[ ! -d ${LAYOUT_DIR} ]] && mkdir -p ${LAYOUT_DIR}

install() {
  local name=${1}
  local color=${2}

  cp -r ${SRC_DIR}/aurorae/${name}*                                                  ${AURORAE_DIR}
  cp -r ${SRC_DIR}/Kvantum/${name}${color}                                           ${KVANTUM_DIR}
  cp -r ${SRC_DIR}/plasma/desktoptheme/${name}${color}                               ${PLASMA_DIR}
  cp -r ${SRC_DIR}/plasma/layout-templates/org.github.desktop.McMojavePanel          ${LAYOUT_DIR}
  cp -r ${SRC_DIR}/plasma/look-and-feel/com.github.vinceliuice.${name}${color}       ${LOOKFEEL_DIR}
  cp -r ${SRC_DIR}/wallpaper/*                                                       ${WALLPAPER_DIR}

  [[ ${color} == '' ]] && \
  cp -r ${SRC_DIR}/color-schemes/McMojave.colors                                     ${SCHEMES_DIR} && \
  cp -r ${SRC_DIR}/color-schemes/McMojave.colors                                     ${PLASMA_DIR}/${name}/colors

  [[ ${color} == '-light' ]] && \
  cp -r ${SRC_DIR}/color-schemes/McMojaveLight.colors                                ${SCHEMES_DIR} && \
  cp -r ${SRC_DIR}/color-schemes/McMojaveLight.colors                                ${PLASMA_DIR}/${name}-light/colors
}

echo "Installing 'McMojave kde themes'..."

for color in "${colors[@]:-${COLOR_VARIANTS[@]}}"; do
  install "${name:-${THEME_NAME}}" "${color}"
done

echo "Install finished..."
