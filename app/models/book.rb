class Book < ActiveRecord::Base
  belongs_to :user

  LANGUAGES = ["English", "French", "Flemish", "Other"]
end
