#!/usr/bin/env bash

set -e

echo "==> Installing Zsh..."
sudo pacman -S --needed --noconfirm zsh git curl

echo "==> Making Zsh your default shell..."
if ! grep -q "/bin/zsh" /etc/shells; then
    echo "/bin/zsh" | sudo tee -a /etc/shells
fi
chsh -s /bin/zsh
cd $HOME/dotfiles/
stow zsh

echo "==> Installing Oh My Zsh..."
export RUNZSH=no
export CHSH=no
export KEEP_ZSHRC=yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "==> Installing plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions || true

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting || true

echo
echo "==> Finished!"
echo "Add the plugins to your ~/.zshrc plugins list:"
echo "  plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"
echo
echo "Then restart your terminal or run: exec zsh"

