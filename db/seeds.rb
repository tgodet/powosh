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

user1 = User.create!(
  provider: "facebook",
  uid: "10207337928501271",
  token: "CAADuVZALlSNMBAN2o9BNVZCtgzTJcMxoMCZCMf5FUOZBntZAj1NTzl3rpinTDteJCl8wgabqDOB6oBy382OE5KwD9bi9zwEZCnA8g2AiadjbO2KtIJ8ciq47seQdoeqRe7bQj8sq6twO4BVqIowphkHwzJSS3ywCrvKJi8xZB9MW5KUn8dn4nDTUjfuZARZBgykiQu8kQyciA0QZDZD",
  token_expiry: "2016-06-13 07:23:49",
  email: "pveggie@hotmail.com",
  password: "password",
  password_confirmation: "password"
  )

user2 = User.create!(
  provider: "facebook",
  uid: "10154000023365520",
  token: "CAADuVZALlSNMBAOYyIgpSU2cp3MTJTsJUScAVBJqia59ZAXamv2OHZAZC3uzcU7A67cwNufZCJ5JB9k0Nj4UFE247ZBrBUBZCuOqGMRTyESjHbjxPUnEm8E45VlUjqzC1LrpKcpYOG0PrS2iTlLZB0EZAaubt2Uqu5BJf98mDirGxYwLArNDdXPVoZBi5BXZC34IHAZD",
  token_expiry: "2016-06-13 19:45:17",
  email: "thibogue@gmail.com",
  password: "password",
  password_confirmation: "password"
  )

user3 = User.create!(
  provider: "facebook",
  uid: "10154147931412082",
  token: "CAADuVZALlSNMBAKTR5dU15mdRZBXZBZB6E6y2WBCpB3k9Er86tWvgPxIVcbPEiv4UQwxdprgWxA5VY6xjvAqBICNT1J5RdWyFrO3g4i9Tmf398Cj3snBJK0VjiE4ZB9vfhKHPOxdM3HTzsU2yFZCdioAJ6gZAZAtYGFAPmXnECbFBpVXFQZC6W6QLZBIue8wPw3kEZD",
  token_expiry: "2016-06-13 19:48:03",
  email: "vanderstraeten.thomas@gmail.com",
  password: "password",
  password_confirmation: "password"
  )

user4 = User.create!(
  provider: "facebook",
  uid: "1023279527753001",
  token: "CAADuVZALlSNMBAGKd6UYD1ZBhA4xptYYRVQ9pAM62HEZA4dLhu0uyr9aZBGcp1I6qcO6AXy8ytdcmceocWBGgTVMyVm7visZAZASZBXUNZCriXgoWcTf5BDvAifBxgjbIEyPxqDHjMDsijy398TCItDRXRCMZCNmlZBbSOwFdXjbFAFhZBV0ejZAHjrh",
  token_expiry: "2016-06-14 08:03:53",
  email: "gutelman.nathaniel@gmail.com",
  password: "password",
  password_confirmation: "password"
  )

user5 = User.create!(
  provider: "facebook",
  password: "password",
  password_confirmation: "password",
  uid: "1064599453578482",
  token: "CAADuVZALlSNMBADIXxPnscXpfiZBOLzbiULzBqV5TsJSa5Rc3ozllo1fseFodWdgnbJVlBvoKL5N2LhZBVpXnPh1R5QA2ECni0lWYlUy3KOp81Ds5lKiUnAEKZATjJxhnyTjt8WXcvhNpTfrhQDzNXAXTJbnjQZBwIpwnOJtFRcQ6MDOSwYnZA1K2CC2TC7MUZD",
  token_expiry: "2016-06-13 17:11:52",
  email: "ricardofuruta@yahoo.com.br"
  )

user6 = User.create!(
  provider: "facebook",
  password: "password",
  password_confirmation: "password",
  uid: "1689923971273014",
  token: "CAADuVZALlSNMBABHr5JjSc2f2Q7QzZCjQhgH3QU4YWtJQhLqHRgNpXjYRnmcpekBfyx9ZBESEAdPL3JQEHzlJwZBHVuC6J2tmN6Ss8vY9bKZC3DOQjIYq1LZBgr7kdmuirMpUaZBklSFgC4nlCZBZBmzm5QWfVWaRBJdOIZACJXY0UeKL84aSDUMh0yds5bLUgqC0uKYcVmZALQvAZDZD",
  token_expiry: "2016-06-14 08:49:41",
  email: "binita.ramla@gmail.com"
  )

user7 = User.create!(
  provider: "facebook",
  password: "password",
  password_confirmation: "password",
  uid: "10153604294498481",
  token: "EAADuVZALlSNMBAIe5MpRzMFeyPZCe4LEmlrpPxWsuH2MXKtDajuwNZAuERj3aZAMdNEyQRxx6y6K3sS66Y48a0QormZCEn0KOd5X3KZCo1WJ0hB66mX2i9RjYfpvxQwq0FoLDIp1zwSfU1CKKjA8pIqJLsNRTP5yUZD",
  token_expiry: "2016-06-13 11:08:05",
  email: "nimrodbahar@gmail.com"
  )

user8 = User.create!(
  provider: "facebook",
  password: "password",
  password_confirmation: "password",
  uid: "10208807862449946",
  token: "EAADuVZALlSNMBAIydf3Ifao74T9VtKxiJMachyKZC4ZAlKL2H2IZBSutMi01U7V7E0mBXLcwmOgM94Hu2OiZARmBIQSupTK2hbbbRABvZCBmxXQLWpDldX6iEqf7wvlmDi0rzhiVMZAgbVEZCd1zZBTL2O0ZCNR5WeJN4ZD",
  token_expiry: "2016-06-14 09:06:09",
  email: "dovaneupen@aol.com"
  )

user9 = User.create!(
  provider: "facebook",
  password: "password",
  password_confirmation: "password",
  uid: "10154060400693607",
  token: "CAADuVZALlSNMBAFZCcIBZBzSog0QbfXLLjCSZCS81VwMwJh7zB8U0TgRRUgkyZCYjRK4JZAwHG6ZCxZCTzo1B7A7aHtuvkQRAZBeNkxp636BfHqGHgZArErLZACPI1Di4XDBWTDwvqeR0JvrqclI86HOIIwjIlZCXflYt7sf5NDNk7xPs5UVOR9zTrRhKkgtdZBsrS6wZD",
  token_expiry: "2016-06-14 09:07:46",
  email: "kevin.de.patoul@me.com"
  )

user10 = User.create!(
  provider: "facebook",
  password: "password",
  password_confirmation: "password",
  uid: "10156846711380650",
  token: "CAADuVZALlSNMBAL7rRzDqzKXiZCWBggFsKYXd3bTMsD3aYb1iar04g5MBmbRrnj6M4ZB53oKlq5ldeXPr6XIo8ZCs3ItioHjNbR9eYXoBANy78JaHENgHwUU20QoZCyxZCQb5YyF78ZArDNncoyYa3PqpwjkyOVY2p5JfZACVOY4jqm0f1CM7ZBM9CGDZC1QtsIt2zhfSWMGFHRgZDZD",
  token_expiry: "2016-06-14 09:18:18",
  email: "arthurbonnecarrere@hotmail.fr"
  )

user11 = User.create!(
  provider: "facebook",
  password: "password",
  password_confirmation: "password",
  uid: "10209388586974363",
  token: "CAADuVZALlSNMBAH3Tlk2wZClM8EvOKC9e2xYjt8cMVZAllkGuHeERl9EWqXzTIuBTyu4pwZBXlKhMfsX8UNN5TK6gtv4sNBGyEoUoTVjTu7fg0mUY1dWcdRTVne2eA5ZAYrigAyadmZBXAXtUPUSUDKSbZBfdaLxKQCrw2QJCyOCEt0sh0GFSJmHlr4LpqxyNwZD",
  token_expiry: "2016-06-14 09:22:56",
  email: "joseph_murat@hotmail.com"
  )

user12 = User.create!(
  provider: "facebook",
  password: "password",
  password_confirmation: "password",
  uid: "220367318353681",
  token: "CAADuVZALlSNMBAL282AtZAPywgIn7rDcYYwy9vD4ZC7wE1okJTcpZA38p6jVZA3oMLo8ZAYdZCd7zWdg1DGLYtmKwRyNkQpBvTY8yWrsUeOzZCoQt7hBWdTlJpIbo7JdcSmrPrhzUPRrKVgR26ZBtsUzFnbjIlZAb6qWlBprZAHkigovCx4484bBndnIatIPpdxruIZD",
  token_expiry: "220367318353681",
  email: "erik.fcbk@gmail.com"
  )

user13 = User.create!(
  provider: "facebook",
  password: "password",
  password_confirmation: "password",
  uid: "10156834044400323",
  token: "CAADuVZALlSNMBAPSqa5GaWa6xWCZAYkgILvtmmlNCTZBAZCc2gxZANm53XGQMaYKLiULuX2WXBSgXiX7C4fyZCrLZA76xRFxZA3v6rw8kTG2WZCC99JS6sNG2z5lUAdZBXmAKa5nSCGjTzzPqxF3nOHxocEt1ZCV1OA2bdyhbs08Iw48mPA05DlDjTW1CRYyts0C9keenSYO1ZAFswZDZD",
  token_expiry: "2016-06-14 09:57:26",
  email: "martimprey@gmail.com"
  )

book_params = [

  {
    title: "The art of possibility",
    language: "en",
    user: user2,
    author: "Rosamund Stone Zander, Benjamin Zander",
    available: true,
    isbn: "9780142001103",
    my_description: "This book has made my life one of infinite possibility",
    my_rating: nil,
    photo: nil,
    google_cover: "http://books.google.be/books/content?id=q0ruAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
    created_with_google: true
  },

  {
     title: "Ten Little Indians",
     language: "en",
     user: user4,
     author: "Sherman Alexie",
     available: true,
     isbn: "9780802141170",
     my_description: "So fantastic! I was so amazed of the end ",
     my_rating: nil,
     photo: nil,
     google_cover: "http://books.google.be/books/content?id=xWQhkWrFZBoC&printsec=frontcover&img=1&zoom=1&source=gbs_api",
     created_with_google: true
  },

  {
     title: "IMBECIL COLETIVO II",
     description: nil,
     language: "pt",
     user: user5,
     author: "OLAVO DE CARVALHO",
     available: true,
     isbn: "9788588062542",
     my_description: "Best philosopher of Brazil",
     my_rating: nil,
     photo: nil,
     google_cover: nil,
     created_with_google: true
  },

  {
    "title"=>"Anne Frank in het achterhuis: wie was wie?",
    "description"=>nil,
    "language"=>"nl",
    "user"=>user6,
    "author"=>"Aukje Vergeest", "available"=>true,
    "isbn"=>"9789086670383", "my_description"=>"True story.. Literally;)",
    "my_rating"=>nil, "photo"=>nil,
    "google_cover"=>"http://books.google.be/books/content?id=HVZ6AgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api",
    "created_with_google"=>true
    },

{"title"=>"Harry Potter and International Relations",
  "description"=>nil, "language"=>"en",
  "user"=>user7,
  "author"=>"Daniel H. Nexon, Iver B. Neumann",
  "available"=>true, "isbn"=>"9780742539594",
  "my_description"=>"Because it's sheer fun! All about fun! THE definition of fun!",
  "my_rating"=>nil, "photo"=>nil,
  "google_cover"=>"http://books.google.be/books/content?id=DKcWE3WXoj8C&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api",
 "created_with_google"=>true},

 {"title"=>"Saltwater Buddha: A Surfers Quest to Find Zen on the Sea (Large Print 16pt)",
  "description"=>nil,
  "language"=>"en",
  "user"=>user8,
  "author"=>"Mu Soeng, Jaimal Yogis", "available"=>true,
  "isbn"=>"9781458783868",
  "my_description"=>"The author writes with a very positive vibe and great eloquence about subjects, which mean a lot to me. In particular, he talks about his own life and spiritual journey, and how surfing has, since a very young age, been a central component to them.",
  "my_rating"=>nil, "photo"=>nil,
  "google_cover"=>"http://books.google.be/books/content?id=B-GP-MrQf4wC&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api",
  "created_with_google"=>true},

  {"title"=>"Céline: Journey to the End of the Night",
    "description"=>nil, "language"=>"fr",
    "user"=>user9,
    "author"=>"John Sturrock", "available"=>true,
    "isbn"=>"9780521378543",
    "my_description"=>"It allowed to finally embrace human beings in all their darkness... ",
    "my_rating"=>nil, "photo"=>nil,
    "google_cover"=>"http://books.google.be/books/content?id=olcJmSwcJSoC&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api",
    "created_with_google"=>true},

  {"title"=>"Survival In Auschwitz",
    "description"=>nil, "language"=>"fr",
    "user"=>user10,
    "author"=>"Primo Levi", "available"=>true,
    "isbn"=>"9780684826806",
    "my_description"=>"This is one of my favourite book,  a testimony of the atrocity of the WWII",
    "my_rating"=>nil, "photo"=>nil,
    "google_cover"=>"http://books.google.be/books/content?id=6w1uHveM54EC&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api",
    "created_with_google"=>true},

  {"title"=>"The Outsiders",
    "description"=>nil, "language"=>"en",
    "user"=>user11,
    "author"=>"SE Hinton", "available"=>true,
    "isbn"=>"9781101642610", "my_description"=>"",
    "my_rating"=>nil, "photo"=>nil,
    "google_cover"=>"http://books.google.be/books/content?id=ha6GIYze5lEC&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api",
    "created_with_google"=>true},

  {"title"=>"Kuolleet sielut", "description"=>nil,
    "language"=>"Other",
    "user"=>user12,
    "author"=>"Nikolai Gogol, Jalo Kalima, Juhani Konkka",
    "available"=>true, "isbn"=>"9789510179024",
    "my_description"=>"Awesome depiction of 19th century Russia",
    "my_rating"=>nil, "photo"=>nil, "google_cover"=>nil,
    "created_with_google"=>true},

    {"title"=>"Je devais aussi tuer",
      "description"=>nil, "language"=>"fr",
      "user"=>user13,
      "author"=>"Nima Zamar", "available"=>true,
      "isbn"=>"9782226141866",
      "my_description"=>"Real autobiography about a former Mossad female agent who achieve to quit these secret services",
      "my_rating"=>nil, "photo"=>nil,
      "google_cover"=>"http://books.google.be/books/content?id=oq0sAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
       "created_with_google"=>true},

    {"title"=>"Boiling A Frog", "description"=>nil,
      "language"=>"en", "user"=>user1,
      "author"=>"Christopher Brookmyre", "available"=>true,
      "isbn"=>"9780748131952",
      "my_description"=>"The plot is gripping and the humour is very, very bitchy.",
      "my_rating"=>nil, "photo"=>nil,
      "google_cover"=>"http://books.google.be/books/content?id=CLxKmYZ_Jc4C&printsec=frontcover&img=1&zoom=1&source=gbs_api",
      "created_with_google"=>true},

      {"title"=>"Deep: Freediving, Renegade Science and What the Ocean Tells Us About Ourselves",
        "description"=>nil, "language"=>"en",
        "user"=>user8,
        "author"=>"James Nestor", "available"=>true,
        "isbn"=>"9781847659064",
        "my_description"=>"Because it is yet another book, which circles the subjects of water and personal well-being. James Nestor very vividly tracks biological human traits, and compares them to various species that live in our oceans. He concludes, based upon the knowledge that the evolutionary ancestors of humans originated from the seas, we, as humans today, inevitably share various capabilities that allows us to flourish in water. Specifically, he compares humans to species that still inhabit the oceans, and takes examples of people who freedive, in order to compare both's biological traits. If you ever wondered why water is such a source of happiness to the majority of humans, you'll definitely find some answers here.",
        "my_rating"=>nil, "photo"=>nil,
        "google_cover"=>"http://books.google.be/books/content?id=KjAlAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api",
        "created_with_google"=>true}

]

book_params.each do |params|
  Book.create!(params)
end

Loan.create(
  user: user1,
  book: (Book.find_by title: "Harry Potter and International Relations"),
  status: "requested",
  pending: true,
  action_owner: Book.first.user.id,
  last_action: "2016-04-10"
  )

Loan.create(
  user: user1,
  book: (Book.find_by title: "Kuolleet sielut"),
  status: "given",
  pending: true,
  action_owner: user1.id,
  last_action: "2016-04-12"
  )





