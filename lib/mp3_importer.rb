class MP3Importer

  attr_reader :path, :files

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["./spec/fixtures/mp3s/*"].collect do |file|
      file.gsub("./spec/fixtures/mp3s/","")
    end
  end

  def import
    files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end



end
