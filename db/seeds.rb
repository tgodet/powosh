# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Book.delete_all

100.times do
  Book.create({
    title: Faker::Book.title,
    author: Faker::Book.author,
    language: (Book::LANGUAGES).sample,
    description: Faker::Hipster.paragraph(3, true, 4)
    })
end
