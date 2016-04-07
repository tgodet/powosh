class Book < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :author, presence:true

  LANGUAGES = ["Englais", "Français", "Néerlandais", "Allemand", "Espagnol", "Portugais", "Other"]
end
