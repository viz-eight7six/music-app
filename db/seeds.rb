# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(email: "user", password: "123456")
Band.create(name: "Kanye West")
Band.create(name: "Tia")
Band.create(name: "Lady Gaga")
Band.create(name: "BackStreetBoys")
Band.create(name: "The Chainsmokers")
Band.create(name: "Snoop Dog")
