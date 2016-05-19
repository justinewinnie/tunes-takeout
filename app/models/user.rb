class User < ActiveRecord::Base
  validates :email, :name, :uid, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    # Find or create a user
  end

#   Validations:
# provider must be a string, must be present, and must equal spotify
# uid must be a string, and must be present
# name, if present, must be a string
end
