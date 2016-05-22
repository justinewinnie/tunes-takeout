class User < ActiveRecord::Base
  validates :email, :name, :uid, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
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



#   Validations:
# provider must be a string, must be present, and must equal spotify
# uid must be a string, and must be present
# name, if present, must be a string
end
