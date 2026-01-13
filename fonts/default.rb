HOME = ENV['HOME']

include_recipe '../helpers/download'

version = '3.4.0'
font_url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v#{version}/UbuntuMono.tar.xz"

download font_url do
  extract_to "#{HOME}/.local/share/fonts"
end

module Fonts
  extend self

  def backend
    @backend ||= MItamae::Backend.new
  end

  def run_command *all
    backend.run_command *all
  end

  def nerdfont_found?
    result = run_command "fc-list | grep 'UbuntuMono Nerd Font'"
    result.success?
  end

  def regenerate_fontscache
    execute "fc-cache -f"
  end

  def update
    unless nerdfont_found?
      regenerate_fontscache
    end
  end
end

Fonts.update
