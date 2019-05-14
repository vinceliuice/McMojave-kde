#!/bin/bash

SRC_DIR=$(cd $(dirname $0) && pwd)

AURORAE_DIR="$HOME/.local/share/aurorae/themes"
SCHEMES_DIR="$HOME/.local/share/color-schemes"
PLASMA_DIR="$HOME/.local/share/plasma/desktoptheme"
LOOKFEEL_DIR="$HOME/.local/share/plasma/look-and-feel"
KVANTUM_DIR="$HOME/.config/Kvantum"

THEME_NAME=McMojave
COLOR_VARIANTS=('' '-light')

install() {
  local name=${1}
  local color=${2}

  local AURORAE_THEME=${AURPRAE_DIR}/${name}${color}
  local PLASMA_THEME=${PLASMA_DIR}/${name}${color}
  local LOOKFEEL_THEME=${LOOKFEEL_DIR}/${name}${color}
  local SCHEMES_THEME=${SCHEMES_DIR}/${name}${color}.colors
  local KVANTUM_THEME=${KVANTUM_DIR}/${name}

  [[ -d ${AURORAE_THEME} ]] && rm -rf ${AURORAE_THEME}
  [[ -d ${PLASMA_THEME} ]] && rm -rf ${PLASMA_THEME}
  [[ -d ${LOOKFEEL_THEME} ]] && rm -rf ${LOOKFEEL_THEME}
  [[ -d ${SCHEMES_THEME} ]] && rm -rf ${SCHEMES_THEME}
  [[ -d ${KVANTUM_THEME} ]] && rm -rf ${KVANTUM_THEME}

  cp -ur ${SRC_DIR}/aurorae/themes/${name}${color}                                   ${AURORAE_DIR}
  cp -ur ${SRC_DIR}/color-schemes/${name}${color}.colors                             ${SCHEMES_DIR}
  cp -ur ${SRC_DIR}/Kvantum/${name}                                                  ${KVANTUM_DIR}
  cp -ur ${SRC_DIR}/plasma/desktoptheme/${name}${color}                              ${PLASMA_DIR}
  cp -ur ${SRC_DIR}/color-schemes/${name}${color}.colors                             ${PLASMA_DIR}/${name}${color}/colors
  cp -ur ${SRC_DIR}/plasma/look-and-feel/com.github.vinceliuice.${name}${color}      ${LOOKFEEL_DIR}
}

echo "Installing 'McMojave kde themes'..."

for color in "${colors[@]:-${COLOR_VARIANTS[@]}}"; do
  install "${name:-${THEME_NAME}}" "${color}"
done

echo "Install finished..."
