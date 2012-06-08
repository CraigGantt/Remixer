# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Song.delete_all
Song.create(title: 'The Anthem',
  artist: 'Good Charlotte',
  description: 'Pop punk, punk rock',
  file: 'The Anthem.wma',
  length: 175)
