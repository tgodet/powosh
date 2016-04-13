class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :loans, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :friendships, dependent: :destroy
  # :friends is defined as being :users in the friendship model
  has_many :friends, through: :friendships, dependent: :destroy

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, omniauth_providers: [:facebook]


  PROFILES_PICS = ["profilepic_1.jpg","profilepic_2.jpg","profilepic_3.jpg","profilepic_4.jpg",
    "profilepic_5.jpg","profilepic_6.jpg","profilepic_7.jpg","profilepic_8.jpg",
    "profilepic_9.jpg","profilepic_10.jpg","profilepic_11.jpg","profilepic_12.jpg",
    "profilepic_13.jpg","profilepic_14.jpg","profilepic_15.jpg","profilepic_16.jpg",
    "profilepic_17.jpg","profilepic_18.jpg","profilepic_19.jpg","profilepic_20.jpg",
    "profilepic_21.jpg","profilepic_22.jpg"]

  #only first_time
  after_create :create_profile

  #check for new friends every time user logs in
  after_save :create_friendships

  # this is for the label in the manual new loan form
  def profile_first_name
    "#{self.profile.first_name} #{self.profile.last_name}"
  end


  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def all_friends
    User.joins("INNER JOIN friendships on friendships.user_id = users.id OR friendships.friend_id = users.id").where.not(id: id).distinct
  end

  private

  def create_profile
    if self.token.nil?
      self.profile = Profile.create(user: self)
    else
      attributes = build_profile_attributes
      self.profile = Profile.create(
        user: self,
        first_name: attributes[:first_name],
        last_name: attributes[:last_name],
        profile_picture: attributes[:profile_picture]
        )
    end
  end

  def build_profile_attributes
    graph = Koala::Facebook::API.new(self.token)
    profile = graph.get_object("me?fields=first_name,last_name")

    attributes = {
      first_name: profile["first_name"],
      last_name: profile["last_name"],
      profile_picture: graph.get_picture("me", {type: 'large'})
    }

  end

  def create_friendships
    unless self.token.nil?
      friends = facebook_friends

      existing_friends_count = Friendship.where(user_id: self.id).count

      # stop if there are no friends using app or if number of friends
      # using app matches number of friendships for user.
      unless friends.empty? || friends.count == existing_friends_count
        friends.each do |friend_fb|
          friend = User.find_by uid: friend_fb["id"]
          check_and_build_friendships(friend)
        end
      end
    end
  end

  def facebook_friends
    graph = Koala::Facebook::API.new(self.token)
    graph.get_connections("me", "friends")
  end

  def check_and_build_friendships(friend)
    if !friend.nil? && (Friendship.find_by user_id: self.id, friend_id: friend.id).nil?
      Friendship.create(user_id: self.id, friend_id: friend.id)
      Friendship.create(user_id: friend.id, friend_id: self.id)
    end
  end
end
