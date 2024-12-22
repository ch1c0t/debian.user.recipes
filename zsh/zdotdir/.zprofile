if [[ ! $DISPLAY && $XDG_VTNR -eq 3 ]]; then
  exec startx
fi
