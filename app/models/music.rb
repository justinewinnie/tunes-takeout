require 'rspotify'

class Music < ActiveRecord::Base
  # receives and models data retrieved from the Spotify API
  BASE_URL = "https://api.spotify.com"
  attr_reader :artist, :album, :track, :music

  def initialize(data = {})
      # @album = data[:album],
      # @artist = data[:artist],
      # @track = data[:track]

      @music =data[:music]
  end

  def self.search(music_id, music_type)
    # music_type == "album" ? @album = RSpotify::Album.find(music_id) : @album = nil
    # music_type == "artist" ? @artist = RSpotify::Artist.find(music_id) : @artist = nil
    # music_type == "track" ? @track = RSpotify::Track.find(music_id) : @track = nil

    music_type == "album" ? @music = RSpotify::Album.find(music_id) : @music = nil
    music_type == "artist" ? @music = RSpotify::Artist.find(music_id) : @music = nil
    music_type == "track" ? @music = RSpotify::Track.find(music_id) : @music = nil

    data = {}
    # data[:album] = @album
    # data[:artist] = @artist
    # data[:track] = @track
    data[:music] = @music

    self.new(data)
  end

  # def music.display(music_object)
  #
  # end

end

# Includes name of the music item, linking to appropriate Spotify page
# - Includes type of the music item (artist, album, track, or playlist)
# - Includes photo/album cover of the music item
# - Includes embedded Spotify player if appropriate (optional)
