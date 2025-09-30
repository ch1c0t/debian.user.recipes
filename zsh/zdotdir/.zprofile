if [[ ! $DISPLAY && $XDG_VTNR -eq 3  ]]; then
  export TERMINAL="sakura"
  exec startx
fi
