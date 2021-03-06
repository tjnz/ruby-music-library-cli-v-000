require_relative "../lib/concerns/findable.rb"
class Genre
	attr_accessor :name, :songs
	@@all = []
	
	extend Concerns::Findable
	
	def initialize(name)
		@name = name
		@songs = []
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		@@all.clear
	end
	
	def self.create(name)
		genre = Genre.new(name)
		genre.save
		genre
	end
	
	def save
		self.class.all << self
	end
	
	def add_song(song)
		if !songs.include?(song)
			@songs << song
			song.genre = self
		end
		self
	end
	
	def artists
		songs.collect {|song| song.artist}.uniq
	end
	
end