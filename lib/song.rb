class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.name = "Jellyfish"
    song.artist_name = "Blockhead"
    song.save
    song
  end

  def self.new_by_name(track_name)
    song = Song.new
    song.name = track_name
    song
  end

  def self.create_by_name(track_name)
    song = Song.new
    song.name = track_name
    song.save
    song
  end

  def self.find_by_name(track_name)
    self.all.find {|song| song.name == track_name}
  end

  def self.find_or_create_by_name(track_name)
    self.find_by_name(track_name) == nil ? self.create_by_name(track_name) : self.find_by_name(track_name)
  end

  def self.alphabetical
    self.all.sort_by {|name| name.name}
  end

  def self.new_from_filename(filename)
    filename_arr = filename.split("-")
    artist = filename_arr[0]
    artist.strip!
    song = filename_arr[1]
    song.slice! ".mp3"
    song.strip!
    final_song = self.new_by_name(song)
    final_song.artist_name = artist
    final_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  def self.destroy_all
    self.all.clear
  end

end
