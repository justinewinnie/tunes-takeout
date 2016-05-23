# Includes name of the music item, linking to appropriate Spotify page
# - Includes type of the music item (artist, album, track, or playlist)
# - Includes photo/album cover of the music item
# - Includes embedded Spotify player if appropriate (optional)

require 'rspotify'

class Music < ActiveRecord::Base
  # receives and models data retrieved from the Spotify API
  BASE_URL = "https://api.spotify.com"
  attr_reader :artist, :album, :track, :music, :name, :img, :url

  def initialize(music_object)
      # @album = data[:album],
      # @artist = data[:artist],
      # @track = data[:track]
      # @img = music_object.images # an array

      # @music = data[:music]
      @name = music_object.name
      @url = music_object.external_urls["spotify"]
      # @name_url = "http://open.spotify.com/" + music_object.type/ + music_object.id/
  end

  # def self.music_list(results)
  # music_list = {}
  #   if results != nil
  #       results["suggestions"].each do |pairing|
  #         music = Music.search(pairing["music_id"], pairing["music_type"])
  #         music_list[:music] = music
  #         music_list[:name] = music.name
  #         music_list[:url] = music.url
  #       end
  #   end
  #   music_list
  # end

  def self.search(music_id, music_type)
    if music_type == "album"
      music_object = RSpotify::Album.find(music_id)
    elsif music_type == "artist"
      music_object = RSpotify::Artist.find(music_id)
    elsif music_type == "track"
      music_object = RSpotify::Track.find(music_id)
      # if track, have to go to album and get album img
    else
      music_object = nil
    end
  end

  def self.hashify(data)
    if data != nil
      sugg_array = []
      data.each do |hash|
        sugg_hash = {}
        sugg_hash["id"] = hash["id"]
        sugg_hash["food_id"] = hash["food_id"]
        sugg_hash["music_id"] = hash["music_id"]
        sugg_hash["music_type"] = hash["music_type"]
        sugg_array << sugg_hash
      end
    end
    sugg_array
  end


end
