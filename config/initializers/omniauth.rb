
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"]
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :yelp, ENV["YELP_CONSUMER_KEY"], ENV["YELP_CONSUMER_SECRET"], ENV["YELP_TOKEN"], ENV["YELP_TOKEN_SECRET"]
# end
