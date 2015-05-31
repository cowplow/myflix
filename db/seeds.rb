# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
comedies = Category.create(name: "Comedies")
dramas = Category.create(name: "Dramas")

Video.create(title: "South Park",
             description: "Respect my authority",
             small_cover_url: "/tmp/south_park.jpg", 
             category: comedies)
Video.create(title: "Futurama",
             description: "Bender Rodriguez",
             small_cover_url: "/tmp/futurama.jpg", 
             category: comedies)
monk = Video.create(title: "Monk",
             description: "Doesn't like germs",
             small_cover_url: "tmp/monk.jpg", 
             large_cover_url: "/tmp/monk_large.jpg", 
             category: dramas)
Video.create(title: "Family Guy", 
             description: "Denizens of Quahoag",
             small_cover_url: "/tmp/family_guy.jpg", 
             category: comedies)
Video.create(title: "South Park",
             description: "Respect my authority",
             small_cover_url: "/tmp/south_park.jpg", 
             category: comedies)
Video.create(title: "Futurama",
             description: "Bender Rodriguez",
             small_cover_url: "/tmp/futurama.jpg", 
             category: comedies)
Video.create(title: "Monk",
             description: "Doesn't like germs",
             small_cover_url: "tmp/monk.jpg", 
             large_cover_url: "/tmp/monk_large.jpg", 
             category: dramas)
Video.create(title: "Family Guy", 
             description: "Denizens of Quahoag",
             small_cover_url: "/tmp/family_guy.jpg", 
             category: comedies)
Video.create(title: "South Park",
             description: "Respect my authority",
             small_cover_url: "/tmp/south_park.jpg", 
             category: comedies)

kevin = User.create(name: "Kevin Wang", password: "password", email: "kevin@example.com")

Review.create(user: kevin, video: monk, rating: 5, content: "This is a really good movie!")
Review.create(user: kevin, video: monk, rating: 2, content: "This is a really horrible movie.")


