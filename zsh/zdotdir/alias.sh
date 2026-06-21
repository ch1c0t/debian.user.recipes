. $(dirname $0)/alias/editor.sh
. $(dirname $0)/alias/systemd.sh
. $(dirname $0)/alias/ruby.sh
. $(dirname $0)/alias/flatpak.sh
. $(dirname $0)/alias/other.sh

if command -v flatpak &> /dev/null; then
  flatpak --user list --app | grep -q 'org.radare.iaito'
  if [ $? -eq 0 ]; then
    . $(dirname $0)/alias/radare2.sh
  fi
fi
