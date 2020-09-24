class MP3Importer
  attr_accessor :song, :path
  
  def initialize(path)
    @path = path
  end
  
  
  def files
    Dir.entries(path).select do |file| 
        file.length > 2
      end
  end
  
  
  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
  
end