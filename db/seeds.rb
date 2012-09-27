# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


c = Chain.create(name: 'Whole Foods')
Place.create(chain: c, street_address: '2201 Wilshire Boulevard, Santa Monica, CA')
Place.create(chain: c, street_address: '500 Wilshire Boulevard, Santa Monica, CA')