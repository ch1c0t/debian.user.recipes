include_recipe '../helpers/download'

download 'https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-13.3.0-amd64-gnome.iso' do
  extract true
end
