#!/bin/bash


echo "Installing..."
sudo pacman -Syu
sudo pacman -S --needed vivaldi git alacritty make git ripgrep fd unzip neovim gcc cmake discord libreoffice-fresh xournalpp vscode
echo "Updating..."
sudo pacman -Syu

########## Configure Alacritty ##########

# https://github.com/alacritty/alacritty-theme
echo "Configuring Alacritty..."
alacritty_path="$HOME/.config/alacritty/themes"

if [ ! -d "$alacritty_path" ]; then
	mkdir -p "$alacritty_path"
	git clone https://github.com/alacritty/alacritty-theme "$alacritty_path"
	touch ~/.config/alacritty/alacritty.toml
	echo '[general]
import = [
	"~/.config/alacritty/themes/themes/ayu_mirage.toml"
]' > "$HOME/.config/alacritty/alacritty.toml"
else 
	echo "Alacritty dir already exists. Skipping..."
fi

######### Configure NeoVim #########

echo "Configuring NeoVim..."

neovim_path="$HOME/.config/nvim"

if [ ! -d "$neovim_path" ]; then
	mkdir -p "$neovim_path"
	git clone https://github.com/CosminMaz/kickstart.nvim "$neovim_path"
else
	echo "NeoVim dir already exists. Skipping..."
fi







