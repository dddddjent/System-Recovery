#!/bin/bash

# put them at the correct location

cp ./configurations/.zshrc ~/.zshrc         -f
cp ./configurations/.bashrc ~/.bashrc       -f
cp ./configurations/.vimrc ~/.vimrc         -f
cp ./configurations/.wezterm.lua ~/.wezterm.lua  -f
cp ./configurations/.ideavimrc ~/.ideavimrc -f     
cp ./configurations/.gitconfig ~/.gitconfig -f
cp ./configurations/.tmux.conf ~/.tmux.conf -f
cp ./configurations/tmuxinator-default.yml ~/.config/tmuxinator/default.yml -f
cp ./configurations/.mypy.ini ~/ -f

mkdir -p ~/.config/kitty
cp ./configurations/kitty/kitty.conf ~/.config/kitty/

mkdir -p ~/.config/ghostty
cp ./configurations/ghostty/config ~/.config/ghostty/
