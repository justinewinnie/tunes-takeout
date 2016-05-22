require 'httparty'

class TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"

  def self.search(keyword)
    @data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response
    @data = @data["suggestions"]
  end

  def self.search_by_id(id)
    @suggestion = HTTParty.get(BASE_URL + "v1/suggestions/" + id["suggestion"]["id"])
  end

  def self.top_twenty
    @data = HTTParty.get(BASE_URL + "v1/suggestions/top?limit=20").parsed_response
    @array = []
      @data["suggestions"].each do |pairing_id|
        @full_info = HTTParty.get(BASE_URL + "v1/suggestions/" + pairing_id).parsed_response
        @array << @full_info["suggestion"]
      end
    @array
  end

  def self.favorites_by_user(uid)
    data = HTTParty.get(BASE_URL + "v1/users/#{uid}/favorites").parsed_response
  end

  # def self.favorite(uid, suggestion_id)
  #   HTTParty.post(BASE_URL + "v1/users/#{uid}/favorites", body: {
  #     "suggestion": "#{suggestion_id}"
  #     })
  # end

  def self.favorite(user, suggestion)
  # call API and say user favorited suggestion
  response = HTTParty.post(BASE_URL + "v1/users/#{user}/favorites",
  body: {
    "suggestion": suggestion
    }.to_json)
  # need to add error handling
end

end
