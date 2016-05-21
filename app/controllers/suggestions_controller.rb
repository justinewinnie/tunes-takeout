
require_relative '../../lib/TunesTakeoutWrapper'


class SuggestionsController < ApplicationController
  attr_reader :show

  def index
    @top_twenty = TunesTakeoutWrapper.top_twenty
    @top_pairings = []
    @top_twenty.each do |suggestion_id|
      suggestion = TunesTakeoutWrapper.search_by_id(suggestion_id)
      food = Food.search(suggestion["suggestion"]["food_id"]).name
      music = Music.search(suggestion["suggestion"]["music_id"], suggestion["suggestion"]["music_type"]).name
      @top_pairings << [music, food, suggestion["suggestion"]["id"]]
    end
    @top_pairings
    # # @favorites = TunesTakeoutWrapper.favorite_ids(current_user.uid) if current_user
  end

# {"id"=>"Vz32Hove9AADSFQ_", "food_id"=>"dahlia-lounge-seattle", "music_id"=>"0pUh9vL0brGUJcVwEQnz1V", "music_type"=>"track"},





  def show
    @results = TunesTakeoutWrapper.search(params[:keyword])
  end

  # def add_favorite
  #   suggestion_id, current_user.uid
  # end
  #
  # def show_favorites
  #   suggestion_id, current_user.uid
  # end
end
