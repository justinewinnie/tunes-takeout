require 'httparty'

class TunesTakeoutWrapper
 BASE_URL = "https://tunes-takeout-api.herokuapp.com/"

 def self.search(keyword)
   @data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response
 end



 # authenticate users before these
 # def self.add(suggestion)
 # end
 #
 # def self.remove(suggestion)
 # end
end
