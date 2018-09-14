#!/usr/bin/bash

j4-dmenu-desktop --dmenu="(cat ; (stest -flx $(echo $PATH | tr : ' ') | sort -u)) | dmenu -nb '#E2EBF0' -nf '#282A2E' -fn 'Hack:pixelsize=12' -sb '#3EA290' -i"
