#!/bin/bash

# Usually $TEXMFDIST is /usr/share/texmf-dist/
sudo sed -i 's/\$Master = "\$Master\/..\/..";/\$Master = "\$Master\/..\/..\/..";/' "$TEXMFDIST/scripts/texlive/tlmgr.pl"

# Then create an alias in bashrc/zshrc
# alias tlmgr='TEXMFDIST/scripts/texlive/tlmgr.pl --usermode'

tlmgr init-usertree

# tlmgr install packages...
