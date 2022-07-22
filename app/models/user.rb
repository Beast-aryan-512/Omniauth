class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable #, omniauth_providers: [:google_oauth2]



  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    provider = access_token.provider
    uid= access_token.uid
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(username: data["name"],
           email: data["email"],
           provider: provider,
           uid: uid,
           image:data["image"],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end

  def self.find_github(access_token, signed_in_resource=nil)
    data = access_token.info
    provider = access_token.provider
    uid= access_token.uid
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(#username: data["name"],
           email: data["email"],
           provider: provider,
           uid: uid,
           image:data["image"],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end
