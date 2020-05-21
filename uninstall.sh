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

uninstall() {
  local name=${1}
  local color=${2}

  local AURORAE_THEME="${AURORAE_DIR}/${name}${color}"
  local PLASMA_THEME="${PLASMA_DIR}/${name}${color}"
  local KVANTUM_THEME="${KVANTUM_DIR}/${name}${color}"
  local LOOKFEEL_THEME="${LOOKFEEL_DIR}/com.github.vinceliuice.${name}${color}"
  local WALLPAPER_THEME="${WALLPAPER_DIR}/${name}${color}"

  [[ -d ${AURORAE_THEME} ]] && rm -rfv ${AURORAE_THEME}
  [[ -d ${PLASMA_THEME} ]] && rm -rfv ${PLASMA_THEME}
  [[ -d ${LOOKFEEL_THEME} ]] && rm -rfv ${LOOKFEEL_THEME}
  [[ -d ${KVANTUM_THEME} ]] && rm -rfv ${KVANTUM_THEME}
  [[ -d ${WALLPAPER_THEME} ]] && rm -rfv ${WALLPAPER_THEME}
}

echo "Uninstalling '${THEME_NAME} kde themes'..."

for color in "${colors[@]:-${COLOR_VARIANTS[@]}}"; do
  uninstall "${name:-${THEME_NAME}}" "${color}"
done

[[ -d ${LAYOUT_DIR}/org.github.desktop.McMojavePanel ]] && rm -rfv ${LAYOUT_DIR}/org.github.desktop.McMojavePanel
[[ -d ${AURORAE_DIR}/McMojave-1.5x ]] && rm -rfv ${AURORAE_DIR}/McMojave-1.5x
[[ -d ${AURORAE_DIR}/McMojave-2.0x ]] && rm -rfv ${AURORAE_DIR}/McMojave-2.0x
[[ -f ${SCHEMES_DIR}/McMojave.colors ]] && rm -rfv ${SCHEMES_DIR}/McMojave.colors
[[ -f ${SCHEMES_DIR}/McMojaveLight.colors ]] && rm -rfv ${SCHEMES_DIR}/McMojaveLight.colors

echo "Uninstall finished..."
