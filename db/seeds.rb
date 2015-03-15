# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

south_park = Video.create(title: "South Park", description: "Respect my authority", small_cover_url: "/public/tmp/south_park.jpg")
futurama = Video.create(title: "Futurama", description: "Bender Rodriguez", small_cover_url: "/public/tmp/futurama.jpg")
monk = Video.create(title: "Monk", description: "Doesn't like germs", small_cover_url: "/public/tmp/monk.jpg", large_cover_url: "/public/tmp/monk_large.jpg")
