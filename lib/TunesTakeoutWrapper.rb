require 'httparty'

class TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"

  def self.search(keyword)
    @data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response
  end

  def self.search_by_id(id)
    @suggestion = HTTParty.get(BASE_URL + "v1/suggestions/" + id)
  end

  def self.top_twenty
    @data = HTTParty.get(BASE_URL + "v1/suggestions/top?limit=20").parsed_response["suggestions"]
  end

  def self.favorites_by_user(uid)
    data = HTTParty.get(BASE_URL + "v1/users/#{uid}/favorites").parsed_response
    return data
  end

  def self.favorite(uid, suggestion_id)
    HTTParty.post(BASE_URL + "v1/users/#{uid}/favorites", body: {
      "suggestion": "suggestion-id"
      })
  end

end
