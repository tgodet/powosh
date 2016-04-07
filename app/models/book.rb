class Book < ActiveRecord::Base
  belongs_to :user

  LANGUAGES = ["Englais", "Français", "Néerlandais", "Allemand", "Espagnol", "Portugais", "Other"]
end
