#!/bin/bash

yay -S $(cat native-pkglist.txt)
yay -S $(cat foreign-pkglist.txt)

# xmake
bash <(curl -fsSL https://xmake.io/shget.text)
