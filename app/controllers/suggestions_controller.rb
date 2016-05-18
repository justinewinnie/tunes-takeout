require_relative '../../lib/TunesTakeoutWrapper'


class SuggestionsController < ApplicationController
  attr_reader :show

  def index

  end

  def show
    @param_results = TunesTakeoutWrapper.search(params[:keyword])
  end

  
end
