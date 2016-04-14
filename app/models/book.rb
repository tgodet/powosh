class Book < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :author, presence:true

  include PgSearch
  pg_search_scope :search_by_title_and_author, against: [ :title, :author ],
  using: { tsearch: { prefix: true } }

  mount_uploader :photo, PhotoUploader



  LANGUAGES = ["en", "fr", "nl", "de", "es", "pt", "Other"]

  def self.of_user(user_id)
    Book.where(user_id: user_id)
  end

  def self.of_friends(user)
    Book.where(user_id: user.all_friends.pluck(:id))
  end
end

# ignoring: :accents
