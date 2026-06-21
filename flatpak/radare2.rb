HOME = ENV['HOME']

execute "flatpak --user -y install --or-update flathub org.radare.iaito"

lab_directory = "#{HOME}/r2.lab"
directory lab_directory
execute "flatpak --user override --filesystem=#{lab_directory} org.radare.iaito"
