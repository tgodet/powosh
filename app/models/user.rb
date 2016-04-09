class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :loans
  has_one :profile
  has_many :books

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, omniauth_providers: [:facebook]


  PROFILES_PICS = ["profilepic_1.jpg","profilepic_2.jpg","profilepic_3.jpg","profilepic_4.jpg",
    "profilepic_5.jpg","profilepic_6.jpg","profilepic_7.jpg","profilepic_8.jpg",
    "profilepic_9.jpg","profilepic_10.jpg","profilepic_11.jpg","profilepic_12.jpg",
    "profilepic_13.jpg","profilepic_14.jpg","profilepic_15.jpg","profilepic_16.jpg",
    "profilepic_17.jpg","profilepic_18.jpg","profilepic_19.jpg","profilepic_20.jpg",
    "profilepic_21.jpg","profilepic_22.jpg"]


    after_create :create_profile

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  private

  def create_profile
    self.profile = Profile.create(user: self)
  end

end
