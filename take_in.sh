#!/bin/bash

# copy all the important configs

cp ~/.zshrc ./configurations/
cp ~/.bashrc ./configurations/
cp ~/.vimrc ./configurations/
cp ~/.wezterm.lua ./configurations/
cp ~/.ideavimrc ./configurations/
cp ~/.gitconfig ./configurations/
cp ~/.tmux.conf ./configurations/
cp ~/.config/tmuxinator/default.yml ./configurations/tmuxinator-default.yml
cp ~/.mypy.ini ./configurations/

mkdir -p ./configurations/kitty
cp ~/.config/kitty/kitty.conf ./configurations/kitty

mkdir -p ./configurations/ghostty
cp ~/.config/ghostty/config ./configurations/ghostty
