class Book < ActiveRecord::Base
  belongs_to :user

  LANGUAGES = ["English", "French", "Dutch", "Other"]
end
