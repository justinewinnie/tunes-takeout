
require_relative '../../lib/TunesTakeoutWrapper'


class SuggestionsController < ApplicationController
  attr_reader :show

  def index
    @data = TunesTakeoutWrapper.top_twenty
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

  # def destroy
  #   TunesTakeoutWrapper.unfavorite(current_user.uid, params[:id])
  #   redirect_to favorite_path
  # end
end
