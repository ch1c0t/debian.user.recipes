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
    The directory to extract files to.
    If not specified:
      it will be inside of the same directory as the downloaded file
      its name will be derived
        from the name of the downloaded file
          by adding ".extract" to its end
  :extract Boolean
    Whether to extract.
    If not specified:
      it is true if :extract_to was specified
      it is false otherwise
=end
define :download, to: nil, extract_to: nil, extract: nil do
  url = params[:name]
  
  file_destination = params[:to]
  extract_directory = params[:extract_to]

  downloads_directory = File.expand_path '~/.local/state/mitamae/downloads'
  file_destination ||= begin
                         file_name = url.split('/').last
                         "#{downloads_directory}/#{file_name}"
                       end

  extract_directory ||= if params[:extract]
                          "#{file_destination}.extract"
                        end

  if url
    file_destination_directory = File.dirname file_destination
    directory file_destination_directory

    execute "wcurl --output #{file_destination} #{url}" do
      not_if "test -f #{file_destination}"
    end

    archive_exts = [
      '.tar.xz',
      '.tar.gz',
    ]

    if extract_directory
      if archive_exts.any? { |ext| url.end_with? ext }
        directory extract_directory
        execute "tar xf #{file_destination} -C #{extract_directory}"
      end
      if url.end_with? '.iso'
        execute "xorriso -osirrox on -indev #{file_destination} -extract / #{extract_directory}" do
          not_if "test -d #{extract_directory}"
        end
      end
    end
  else
    fail "Please pass something with which a resource to be downloaded can be identified."
  end
end
