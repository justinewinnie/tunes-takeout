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

#   {
#   "href":"https://tunes-takeout-api.herokuapp.com/v1/users/hamled2/favorites",
#   "suggestions":[
#     "VzoxXvLQUmT7dPJ5",
#     "VzoxXvLQUmT7dPJ6"
#   ]
# }


 # [{"id"=>"Vz0KQY-RRwADboE-", "food_id"=>"a-la-mode-pies-seattle", "music_id"=>"1OYLLmDS0pJVFRbUo19vrG", "music_type"=>"album"}, {"id"=>"Vz0KQY-RRwADboEQ", "food_id"=>"old-school-frozen-custard-seattle", "music_id"=>"1hq33mOCO3eLxvgBl0leqP", "music_type"=>"track"}, {"id"=>"Vz0KO4-RRwADbn9t", "food_id"=>"taqueria-la-pasadita-seattle-3", "music_id"=>"0jEsVskTgxfybttvO9gnLK", "music_type"=>"album"}, {"id"=>"Vz0KNY-RRwADbn29", "food_id"=>"sweet-iron-seattle-2", "music_id"=>"0cOpQTKJdCEzz2wplnnyP6", "music_type"=>"artist"}, {"id"=>"Vz0KO4-RRwADbn9c", "food_id"=>"el-taco-loco-seattle-2", "music_id"=>"0qO38KC2CGDmNSOAb2rpzj", "music_type"=>"track"}]

  # def self.prettify(sugg_array)
  #   sugg_array.each do |suggestion|
  #     @food = Food.search(suggestion[:food_id])
  #     @music = Music.search(suggestion[:music_id], suggestion[:music_type])
  #   end
  # end

end
