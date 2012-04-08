# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

book_titles = [
  "Introduction to Algorithms", "Geometry Revisited",
  "The Well Grounded Rubyist", "Code Complete", "Object Oriented Design and Patterns",
  "Smalltalk Best Practice Patterns", "The Cucumber Book"
].each do |t|
  Book.create title: t
end


