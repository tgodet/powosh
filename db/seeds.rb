# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Loan.delete_all
Book.delete_all
Profile.delete_all
Friendship.delete_all
User.delete_all

User.create!(email: "test1@test.com", password: "testtest")
User.create!(email: "test2@test.com", password: "testtest")
User.create!(email: "test3@test.com", password: "testtest")
User.create!(email: "test4@test.com", password: "testtest")
User.create!(email: "test5@test.com", password: "testtest")
User.create!(email: "test6@test.com", password: "testtest")

profile_attributes = [
  {
    user_id: (User.find_by email: "test1@test.com").id,
    first_name: "Percival",
    profile_picture: "profilepic_1.jpg"
    },
  {
    user_id: (User.find_by email: "test2@test.com").id,
    first_name: "Mario",
    profile_picture: "profilepic_2.jpg"
    },
  {
    user_id: (User.find_by email: "test3@test.com").id,
    first_name: "Gary",
    profile_picture: "profilepic_3.jpg"
    },
  {
    user_id: (User.find_by email: "test4@test.com").id,
    first_name: "Sturm",
    profile_picture: "profilepic_4.jpg"
  },
    {
    user_id: (User.find_by email: "test5@test.com").id,
    first_name: "Jerry",
    profile_picture: "profilepic_5.jpg"
  },
    {
    user_id: (User.find_by email: "test6@test.com").id,
    first_name: "Pete",
    profile_picture: "profilepic_6.jpg"
  }
]

profile_attributes.each { |params| Profile.create!(params) }

rand_friend_1 = User.all.sample
rand_friend_2 = User.all.sample
rand_friend_3 = User.all.sample

Friendship.create!(user_id: User.first.id, friend_id: User.last.id)
Friendship.create!(user_id: User.last.id, friend_id: User.first.id)

Friendship.create!(user_id: User.first.id, friend_id: rand_friend_1.id)
Friendship.create!(user_id: rand_friend_1.id, friend_id: User.first.id)

Friendship.create!(user_id: User.first.id, friend_id: rand_friend_2.id)
Friendship.create!(user_id: rand_friend_2.id, friend_id: User.first.id)

Friendship.create!(user_id: User.first.id, friend_id: rand_friend_3.id)
Friendship.create!(user_id: rand_friend_3.id, friend_id: User.first.id)


300.times do
  Book.create({
    user_id: (User.all).sample.id,
    title: Faker::Book.title,
    author: Faker::Book.author,
    language: (Book::LANGUAGES).sample,
    description: "I love this book. " + Faker::Hipster.paragraph(3, true, 4),
    available: true
    })
end

20.times do
  book = (Book.all).sample
  Loan.create({
    user_id: (User.all).sample.id,
    book_id: book.id,
    status: "requested",
    pending: true,
    action_owner: book.user.id,
    last_action: Date.today
})

end
