require 'pry'

class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def songs
    @songs
  end

  def add_song(song)
    songs << song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    artist_names = all.collect { |artist| artist.name }
    Artist.new(name) unless artist_names.include?(name)
    all[-1]
  end

  def print_songs

    self.songs.each do |song|
      puts song.name
    end
  end

end
