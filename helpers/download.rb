=begin
params
  :name String
    A URL. An address to download the file from.
  :to String
    The file path to save the downloaded file to.
    If not specified:
      it will be a path inside of ~/.local/state/mitamae/downloads
      its filename will be derived from :name
  :extract_to String
    The directory to extract files from the downloaded file.
=end
define :download, to: nil, extract_to: nil do
  url = params[:name]
  
  file_destination = params[:to]
  extract_directory = params[:extract_to]

  if url
    downloads_directory = File.expand_path '~/.local/state/mitamae/downloads'
    file_destination ||= begin
                           file_name = url.split('/').last
                           "#{downloads_directory}/#{file_name}"
                         end
    file_destination_directory = File.dirname file_destination
    directory file_destination_directory

    execute "wcurl --output #{file_destination} #{url}" do
      not_if "test -f #{file_destination}"
    end

    if extract_directory
      directory extract_directory
      if url.end_with? '.tar.xz'
        execute "tar xf #{file_destination} -C #{extract_directory}"
      end
    end
  else
    fail "Please pass something with which a resource to be downloaded can be identified."
  end
end
