require 'rspotify'

class Music < ActiveRecord::Base
  # receives and models data retrieved from the Spotify API
  BASE_URL = "https://api.spotify.com"
  attr_reader :artist, :album, :track, :type

  def initialize(data = {})
      @album = data[:album],
      @artist = data[:artist],
      @track = data[:track],
      @music_type = data[:music_type]
  end

  def self.search(music_id, music_type)
    music_type == "album" ? @album = RSpotify::Album.find(music_id) : @album = nil
    music_type == "artist" ? @artist = RSpotify::Artist.find(music_id) : @artist = nil
    music_type == "track" ? @track = RSpotify::Track.find(music_id) : @track = nil

    data = {}
    data[:album] = @album
    data[:artist] = @artist
    data[:track] = @track
    data[:music_type] = music_type

    self.new(data)
  end

  def get_type(music)
    if music.music_type == "album"
      music.album
    elsif music.music_type == "artist"
      music.artist
    elsif music.music_type == "track"
      music.track
    end
  end
end

# Includes name of the music item, linking to appropriate Spotify page
# - Includes type of the music item (artist, album, track, or playlist)
# - Includes photo/album cover of the music item
# - Includes embedded Spotify player if appropriate (optional)

# require 'httparty'
#
# class Pokemon
#   BASE_URL = "http://pokeapi.co/api/v2/"
#   attr_reader :name, :moves, :sprites
#
#   def initialize(data)
#     @name = data["name"]
#     @moves = data["moves"]
#     @sprites = reject_null_sprites(data["sprites"])
#   end
#
#   def sprite_urls
#     sprites.values
#   end
#
#   def favorite_move
#     HTTParty.get(moves.sample["move"]["url"]).parsed_response
#   end
#
#   def self.find(id)
#     # http://pokeapi.co/api/v2/pokemon/25/
#     # find a pokemon with the passed id
#     data = HTTParty.get(BASE_URL + "pokemon/#{id}/").parsed_response
#
#     # return an instance of pokemon for that id
#     self.new(data)
#   end
#
#   private
#
#   def reject_null_sprites(sprite_hash)
#     sprite_hash.reject do |name, url|
#       url.nil?
#     end
#   end
# end
