class Book < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :author, presence:true

  include PgSearch
  pg_search_scope :search_by_title_and_author, against: [ :title, :author ],
  using: { tsearch: { prefix: true } }

  mount_uploader :photo, PhotoUploader



  LANGUAGES = ["Englais", "Français", "Néerlandais", "Allemand", "Espagnol", "Portugais", "Other"]

  def self.of_user(user_id)
    Book.where(user_id: user_id)
  end

  def self.of_friends(user_id)
    Book.joins(user: :friendships).where("friendships.friend_id = '#{user_id}'")
  end
end


# ignoring: :accents
