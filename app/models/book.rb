class Book < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :author, presence:true

  LANGUAGES = ["Englais", "Français", "Néerlandais", "Allemand", "Espagnol", "Portugais", "Other"]

  def self.of_user(user_id)
    Book.where(user_id: user_id)
  end

  def self.of_friends(user_id)
    Book.joins(user: :friendships).where("friendships.friend_id = '#{user_id}'")
  end
end
