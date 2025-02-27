if [[ $UID == 0 ]]; then
  alias s="systemctl"
  alias j="journalctl"
  alias bu="busctl"
else
  alias s="systemctl --user"
  alias j="journalctl --user"
  alias bu="busctl --user"
fi
