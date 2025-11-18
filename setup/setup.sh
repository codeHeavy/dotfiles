#!/usr/bin/env bash

set -e

GREEN="\e[32m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"

msg() { echo -e "${CYAN}==>${RESET} $1"; }
ok()  { echo -e "${GREEN}✔${RESET} $1"; }
err() { echo -e "${RED}✖${RESET} $1"; }


if ! command -v yay &>/dev/null; then
    msg "yay not found. Installing yay..."

    sudo pacman -Sy --needed --noconfirm base-devel git

    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (
        cd /tmp/yay
        makepkg -si --noconfirm
    )
    rm -rf /tmp/yay

    ok "yay installed!"
else
    ok "yay already installed."
fi

msg "Installing arch packages…"

sudo pacman -Sy --noconfirm ttf-jetbrains-mono-nerd fzf stow ghostty neovim waybar rofi-wayland hyprlock hyprpaper hypridle tree tldr yazi btop brightnessctl cliphist wl-clipboard swappy jq

msg "Pacman packages installed!"

msg "Installing AUR package: zen-browser-bin"

yay -S --noconfirm zen-browser-bin

ok "AUR packages installed."

msg "Setup complete!"
