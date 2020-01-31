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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def parse_filename(filename)
    filename.slice(".mp3").split(" - ")
  end

  def self.new_from_filename(filename)
    song_title = filename.chomp(".mp3").split(" - ")
    song = self.new_by_name(song_title[1])
    song.artist_name = song_title[0]
    song
  end

  def self.create_from_filename(filename)
    song_title = filename.chomp(".mp3").split(" - ")
    song = self.create_by_name(song_title[1])
    song.artist_name = song_title[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
