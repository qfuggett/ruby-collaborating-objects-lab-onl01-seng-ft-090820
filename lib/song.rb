class Song
  attr_accessor :name, :artist
  
  @@all = [ ]
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(name)
    name_splitarray = name.split(" - ")
    song = Song.new(name_splitarray[1])
    artist_name = Artist.new(name_splitarray[0])
    song.artist = artist_name
    song
   
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    #assigning an artist object (either new or existing because of .find_or_create_by_name, to a given song's artist attribute
  end
  
  
end