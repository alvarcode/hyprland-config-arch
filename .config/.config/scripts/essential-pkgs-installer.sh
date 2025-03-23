#!/bin/bash
pkgs=(
	"rofi"
	"btop"
	"fastfetch"
	"cmus"
	"nodejs-lts-jod"
	"npm"
	"gcc"
	"neovim"
	"ranger"
	"alacritty"
	"zsh"
	"chromium"
)

echo -e "\033[32m\033[0m Instalador de paquetes esenciales"

if [ ${#pkgs[*]} -eq 0 ]; then
	echo "No hay paquetes para instalar"
	exit
fi

_pkgs=""
for pack in $pkgs; do
	_pkgs="$_pkgs$pack"
done

sudo pacman -S $_pkgs

if [ $? -ne 0 ]; then
	echo "Ocurrió un error al instalar los paquetes :("
fi
