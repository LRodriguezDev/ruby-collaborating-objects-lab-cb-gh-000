class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def songs
    Song.find_by_artist(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(artist_name)
    artist = @@all.detect {|artist| artist.name == artist_name }
    if artist != nil
      artist
    else
      artist = self.new(artist_name)
      artist
    end
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end
end
