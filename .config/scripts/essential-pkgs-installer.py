#!/usr/bin/env python
from os import system

pkgs = [
    "xdg-desktop-portal-hyprland",
    "hyprlock",
    "waybar",
    "hyprpaper",
    "rofi",
    "btop",
    "fastfetch",
    "cmus",
    "neovim",
    "ranger",
    "alacritty",
    "zsh",
    "chromium"
]

print("\033[32m\uf061\033[0m Instalador de paquetes esenciales\n")

if len(pkgs) == 0:
    print("No hay paquetes para instalar")
    exit()

try:
    _pkgs = ""
    for pack in pkgs:
        _pkgs += f"{pack} "
    system("sudo pacman -S " + _pkgs)

except Exception as ex:
    print("\033[31mError no controlado: \033[0m" + str(ex))

