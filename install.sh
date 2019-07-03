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

  local AURORAE_THEME="${AURORAE_DIR}/${name}${color}"
  local PLASMA_THEME="${PLASMA_DIR}/${name}${color}"
  local LOOKFEEL_THEME="${LOOKFEEL_DIR}/com.github.vinceliuice.${name}${color}"
  local KVANTUM_THEME="${KVANTUM_DIR}/${name}${color}"

  mkdir -p                                                                           ${AURORAE_DIR}
  mkdir -p                                                                           ${SCHEMES_DIR}
  mkdir -p                                                                           ${PLASMA_DIR}
  mkdir -p                                                                           ${LOOKFEEL_DIR}
  mkdir -p                                                                           ${KVANTUM_DIR}

  [[ -d ${AURORAE_THEME} ]] && rm -r ${AURORAE_THEME}
  [[ -d ${PLASMA_THEME} ]] && rm -r ${PLASMA_THEME}
  [[ -d ${LOOKFEEL_THEME} ]] && rm -r ${LOOKFEEL_THEME}
  [[ -d ${SCHEMES_DIR}/McMojave.colors ]] && rm -r ${SCHEMES_DIR}/McMojave.colors
  [[ -d ${SCHEMES_DIR}/McMojaveLight.colors ]] && rm -r ${SCHEMES_DIR}/McMojaveLight.colors
  [[ -d ${KVANTUM_THEME} ]] && rm -rf ${KVANTUM_THEME}

  cp -ur ${SRC_DIR}/aurorae/${name}${color}                                          ${AURORAE_DIR}
  cp -ur ${SRC_DIR}/Kvantum/${name}${color}                                          ${KVANTUM_DIR}
  cp -ur ${SRC_DIR}/plasma/desktoptheme/${name}${color}                              ${PLASMA_DIR}
  cp -ur ${SRC_DIR}/plasma/look-and-feel/com.github.vinceliuice.${name}${color}      ${LOOKFEEL_DIR}

  [[ ${color} == '' ]] && \
  cp -ur ${SRC_DIR}/color-schemes/McMojave.colors                                    ${SCHEMES_DIR} && \
  cp -ur ${SRC_DIR}/color-schemes/McMojave.colors                                    ${PLASMA_DIR}/${name}/colors

  [[ ${color} == '-light' ]] && \
  cp -ur ${SRC_DIR}/color-schemes/McMojaveLight.colors                               ${SCHEMES_DIR} && \
  cp -ur ${SRC_DIR}/color-schemes/McMojaveLight.colors                               ${PLASMA_DIR}/${name}-light/colors
}

echo "Installing 'McMojave kde themes'..."

for color in "${colors[@]:-${COLOR_VARIANTS[@]}}"; do
  install "${name:-${THEME_NAME}}" "${color}"
done

echo "Install finished..."
