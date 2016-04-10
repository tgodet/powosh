class Friendship < ActiveRecord::Base
  belongs_to :user

  #for letting us call current_user.friends
  belongs_to :friend, class_name: 'User'
end
