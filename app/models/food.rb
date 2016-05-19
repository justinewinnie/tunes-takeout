require 'yelp'
require 'httparty'

class Food < ActiveRecord::Base
  # receives and models data retrieved from the Yelp Search API
  BASE_URL = "https://api.yelp.com/v2/business/"
  attr_reader :business_id, :name, :url, :img_url, :phone, :rating

  def initialize(data)
    @business_id = data.id
    @name = data.name
    @url = data.url
    @img_url = data.rating_img_url
    @phone = data.phone
    @rating = data.rating
  end

  def self.search(food_id)
    data = Yelp.client.business(food_id.parameterize).business
    self.new(data)
  end

end
