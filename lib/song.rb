require 'pry'

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    new_song = Song.new(file_name)
    split_name = file_name.split(" - ")
    new_song.name = split_name[1]
    @artist_name = split_name[0]
    new_song.artist=(@artist_name)
    @@all << new_song
    new_song
  end

  def artist=(name)
    if name.class == String
      @artist = Artist.find_or_create_by_name(name)
    else
      @artist = Artist.find_or_create_by_name(name.name)
    end
    @artist.add_song(self)
    @artist
    # binding.pry
  end

end
