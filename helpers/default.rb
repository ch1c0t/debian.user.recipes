define :links_in, to_each_file_in: nil do
  destination_directory = params[:name]

  if params[:to_each_file_in]
    source_directory = params[:to_each_file_in]
  else
    raise "The source directory should be passed in the 'to_each_file_in' attribute."
  end

  relatives = ['.','..']
  Dir.foreach source_directory do |file|
    unless relatives.include? file
      link "#{destination_directory}/#{file}" do
        to "#{source_directory}/#{file}"
      end
    end
  end
end
