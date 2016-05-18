require 'yelp'

class Food < ActiveRecord::Base
  # receives and models data retrieved from the Yelp Search API
  BASE_URL = "https://api.yelp.com/v2/business/"
  attr_reader :business_id, :name, :url, :img_url, :phone, :rating

  def initialize(data)
    @business_id = data["business_id"]
    @name = data["name"]
    @url = data["url"]
    @img_url = data["img_url"]
    @phone = data["phone"]
    @rating = data["data"]
  end

  def self.find(id)
    data = HTTParty.get(BASE_URL + "#{id}").parsed_response
    self.new(data)
  end

end
