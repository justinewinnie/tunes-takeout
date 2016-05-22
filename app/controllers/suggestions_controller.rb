
require_relative '../../lib/TunesTakeoutWrapper'


class SuggestionsController < ApplicationController
  attr_reader :show

  def index
    @data = TunesTakeoutWrapper.top_twenty
    # @top_pairings = []
    # @top_twenty.each do |suggestion_id|
    #   suggestion = TunesTakeoutWrapper.search_by_id(suggestion_id)
    #   food = Food.search(suggestion["suggestion"]["food_id"]).name
    #   music = Music.search(suggestion["suggestion"]["music_id"], suggestion["suggestion"]["music_type"]).name
    #   @top_pairings << [music, food, suggestion["suggestion"]["id"]]
    # end
    # @top_pairings
    # # @favorites = TunesTakeoutWrapper.favorite_ids(current_user.uid) if current_user
  end

  def show
    @data = TunesTakeoutWrapper.search(params[:keyword])
  end

  def favorite
    response = TunesTakeoutWrapper.favorite(current_user.uid, params["suggestion_id"])
    redirect_to root_path
  end

  def favorites
    @data = []
    faves = TunesTakeoutWrapper.favorites_by_user(current_user.uid)
    faves["suggestions"].each do |id|
      info = HTTParty.get("https://tunes-takeout-api.herokuapp.com/v1/suggestions/" + id).parsed_response
      @data << info["suggestion"]
    end
    @data
  end

  #   {
  #   "href":"https://tunes-takeout-api.herokuapp.com/v1/users/hamled2/favorites",
  #   "suggestions":[
  #     "VzoxXvLQUmT7dPJ5",
  #     "VzoxXvLQUmT7dPJ6"
  #   ]
  # }

  # def favorites
  # @yelp = {}
  # @spotify_hash = {}
  # user = current_user.uid
  # # returns hash with key "suggestion" and value is array of pair-ids
  # favorites = TunesTakeoutWrapper.favorites(user)
  # favorites = favorites["suggestions"]
  # favorites_data = TunesTakeoutWrapper.search_by_pair(favorites)
  # favorites_data.each do |pair|
  #   @yelp.merge!(TunesTakeoutWrapper.get_yelp_hash([pair["suggestion"]]))
  #   @spotify_hash.merge!(TunesTakeoutWrapper.get_spotify_hash([pair["suggestion"]]))
  # end
  # @yelp_array = Food.find(@yelp)
  # # info is array of arrays [pair_id, food_instance, music_instance]
  # @info = Music.find(@spotify_hash, @yelp_array)
  # # raise
  # end
end
