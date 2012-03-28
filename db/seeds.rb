# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[ ["G", "General audiences"],
  ["PG", "Parental guidance suggested"],
  ["PG-13", "Parents strongly cautioned"],
  ["R", "Restricted"],
  ["NC-17", "No one under 17 admitted"],
  ["Unrated", "This movie has not been rated"]
].each do |name, description|
  rating = Rating.find_by_name(name) || Rating.new(name: name)
  rating.description = description
  rating.save!
end

