# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Loan.delete_all
Book.delete_all
User.delete_all

User.create!(email: "test1@test.com", password: "testtest")
User.create!(email: "test2@test.com", password: "testtest")
User.create!(email: "test3@test.com", password: "testtest")
User.create!(email: "test4@test.com", password: "testtest")
User.create!(email: "test5@test.com", password: "testtest")
User.create!(email: "test6@test.com", password: "testtest")

100.times do
  Book.create({
    user_id: (User.all).sample.id,
    title: Faker::Book.title,
    author: Faker::Book.author,
    language: (Book::LANGUAGES).sample,
    description: Faker::Hipster.paragraph(3, true, 4),
    available: true
    })
end

20.times do
  Loan.create({
    user_id: (User.all).sample.id,
    book_id: (Book.all).sample.id,
    pending: true
})

end
