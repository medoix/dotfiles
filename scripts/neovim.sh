#!/bin/bash
cd ~
sudo rm -r neovim
sudo pacman --noconfirm -S cmake unzip
git clone https://github.com/neovim/neovim
cd neovim
sudo make CMAKE_BUILD_TYPE=Release install
cd ~
sudo rm -r neovim
