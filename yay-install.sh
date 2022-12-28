#!/bin/bash

yay -S neovim\
    cmake\
    fzf\
    wemeet-bin\
    clangd\
    python\
    lua\
    gcc\
    tree\
    cuda
    
bash <(curl -fsSL https://xmake.io/shget.text)
