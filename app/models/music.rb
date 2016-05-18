require 'rspotify'

class Music < ActiveRecord::Base
  # receives and models data retrieved from the Spotify API
  BASE_URL = "https://developer.spotify.com/web-api/"
  attr_reader :

  def initialize(data)
    @artist = data["artist"]
    @album = data["album"]
    @track = data["track"]
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
