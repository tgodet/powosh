class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :loans
  has_many :books

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books

  PROFILES_PICS = ["profilepic_1.jpg","profilepic_2.jpg","profilepic_3.jpg","profilepic_4.jpg",
    "profilepic_5.jpg","profilepic_6.jpg","profilepic_7.jpg","profilepic_8.jpg",
    "profilepic_9.jpg","profilepic_10.jpg","profilepic_11.jpg","profilepic_12.jpg",
    "profilepic_13.jpg","profilepic_14.jpg","profilepic_15.jpg","profilepic_16.jpg",
    "profilepic_17.jpg","profilepic_18.jpg","profilepic_19.jpg","profilepic_20.jpg",
    "profilepic_21.jpg","profilepic_22.jpg"]

end
