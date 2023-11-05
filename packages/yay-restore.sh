#!/bin/bash

paru -S $(cat native-pkglist.txt)
paru -S $(cat foreign-pkglist.txt)

# xmake
bash <(curl -fsSL https://xmake.io/shget.text)
