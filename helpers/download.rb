define :download, to: nil, extract_to: nil do
  url = params[:name]
  
  file_destination = params[:to]
  path_destination = params[:extract_to]

  unless file_destination or path_destination
    message = <<~S
    The required params were not passed.
    The `download` helper expects either

      params[:to] String
        The file path to save the downloaded file to.

      or

      params[:extract_to] String
        The path to the directory to extract the downloaded archive.
        The directory will be created if it does not exist.

      or both of the above.
    S
    fail message
  end

  if url
    tmp_directory = File.expand_path '~/.local/state/mitamae/download'
    file_destination ||= begin
                           file_name = url.split('/').last
                           "#{tmp_directory}/#{file_name}"
                         end
    file_destination_path = File.dirname file_destination
    directory file_destination_path
    execute "wcurl --output #{file_destination} #{url}" do
      not_if "file -f #{file_destination}"
    end

    if path_destination
      directory path_destination
      if url.end_with? '.tar.xz'
        execute "tar xf #{file_destination} -C #{path_destination}"
      end
    end
  else
    fail "Please pass something with which a resource to be downloaded can be identified."
  end
end
