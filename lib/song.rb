class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(artist_name)
    artist = Artist.find_or_create_by_name(artist_name)
    @artist = artist
    artist.save
    @artist
  end

  def self.new_by_filename(filename)
    song_name = filename.split(" - ")[1]
    song = self.new(song_name)
    song.artist_name = filename.split(" - ")[0]
    song
  end
end
