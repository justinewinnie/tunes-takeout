class User < ActiveRecord::Base
  validates :name, :uid, :provider, presence: true

  def self.find_or_create_by_omniauth(auth_hash)
    # Find or create a user
    user = self.find_by(provider: auth_hash[:provider], uid: auth_hash[:uid])

    if user != nil
      return user
    else
      user = User.new
      user.uid = auth_hash["uid"]
      user.provider = auth_hash["provider"]
      user.name = auth_hash["info"]["name"]
      user.email = auth_hash["info"]["email"]
      user.image = auth_hash["info"]["image"]
      if user.save
        return user
      else
        return nil
      end
    end
  end

end

# > {"provider"=>"spotify",
#  "uid"=>"1275942771",
#  "info"=>
#   {"name"=>"Justine Winnie",
#    "nickname"=>"1275942771",
#    "email"=>nil,
#    "urls"=>{"spotify"=>"https://open.spotify.com/user/1275942771"},
#    "image"=>
#     "https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/11902547_10204964062804884_6862998421758436106_n.jpg?oh=0c32fa6917c2f4f111bc59cde64e14c8&oe=57E4781E"},
#  "credentials"=>
#   {"token"=>
#     "BQAIoGxnsvUoQL44XfFSby80ECBsax1QTlWPyqObgCi02yq_AGNf64nllzNXleqE9WfVAs8-bE_7u0JKfGwV6R2QbYV6BwZVLzArBtFYv2YRQ5QcG7feBJt5oQmwiFIS-PtWR-oEmt_WNUg",
#    "refresh_token"=>
#     "AQCOLKvmLdiiZhhgceQhMeHw8lgBXnRgEbfb-L2FXDdOt-_AXEesnwPw9D1zTT7Cvfa4xG4srj46XRfmBWVZdX-yefYLFSJigLbnX5nKlvyx4bUwN3w7h9viw5Jh7d1uCBE",
#    "expires_at"=>1463700668,
#    "expires"=>true},
#  "extra"=>
#   {"raw_info"=>
#     {"display_name"=>"Justine Winnie",
#      "external_urls"=>{"spotify"=>"https://open.spotify.com/user/1275942771"},
# [2] pry(#<SessionsController>)> auth_hash[:info]
# => {"name"=>"Justine Winnie",
#  "nickname"=>"1275942771",
#  "email"=>nil,
#  "urls"=>{"spotify"=>"https://open.spotify.com/user/1275942771"},
#  "image"=>
#   "https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/11902547_10204964062804884_6862998421758436106_n.jpg?oh=0c32fa6917c2f4f111bc59cde64e14c8&oe=57E4781E"}
