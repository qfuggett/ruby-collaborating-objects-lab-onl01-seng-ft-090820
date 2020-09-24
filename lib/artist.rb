require 'pry'

class Artist
  attr_accessor :name
  
  @@all = [ ]
  
  def initialize (name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    self.songs << song
    song.artist = self
  end
  
  def songs
    Song.all.select {|song| song.artist == self}  
    
  end
  
  def self.find_or_create_by_name(name)
   found_artist = @@all.find do |element|
       element.name == name
    end
    #binding.pry
    if found_artist 
      found_artist
    else
      name = Artist.new(name)
    end
  end
  
  def print_songs
    songs.each do |individual_song|     #looping through the objects returned from the songs method
      puts individual_song.name
    end
    
  end
    
  
end