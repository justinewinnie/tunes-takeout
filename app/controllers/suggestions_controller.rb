require_relative '../../lib/TunesTakeoutWrapper'


class SuggestionsController < ApplicationController
  attr_reader :show

  def index
    # @results = TunesTakeoutWrapper.search(params[:keyword])
  end

  def show
    @results = TunesTakeoutWrapper.search(params[:keyword])
    # @foods = Food.search(@results.each do |suggestion| suggestion["food_id"] end)

    # @music =
  end

end
