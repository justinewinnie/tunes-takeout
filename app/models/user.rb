class User < ActiveRecord::Base
  validates :email, :name, :uid, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
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
