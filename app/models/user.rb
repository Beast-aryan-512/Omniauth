class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable  #, omniauth_providers: [:google_oauth2]



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

  def self.from_omniauth(auth)
  name_split = auth.info.name.split(" ")
  user = User.where(email: auth.info.email).first
  user ||= User.create!(provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0, 20])
    user
end
 

def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    # user.name = auth.info.name # assuming the user model has a name
    # user.username = auth.info.nickname # assuming the user model has a username
    #user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
    end
  end

end
