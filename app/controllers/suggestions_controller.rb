require_relative '../../lib/TunesTakeoutWrapper'


class SuggestionsController < ApplicationController
  attr_reader :show

  def index

  end

  def show
    @results = TunesTakeoutWrapper.search(params[:keyword])
    # @food = show_food(@results)
  end

  # def show_food(results)
  #   Food.find(results["suggestions"][0]["food_id"])
  # end
  #
  # Food.find(@results.id)
  #
  # Music.find(@results.id)


end
