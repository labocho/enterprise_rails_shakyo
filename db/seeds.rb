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

[ ["02139", "CAMBRIDGE", "MA", "MIDDLESEX", BigDecimal("0.42365079E2", 12), BigDecimal("-0.71104519E2", 12)],
  ["02445", "BROOKLINE", "MA", "MIDDLESEX", BigDecimal("0.42329300E2", 12), BigDecimal("-0.71131200E2", 12)],
  # ...
].each do |zip, city, state_abbr, country, lat, long|
  zip_code = ZipCode.find_by_zip(zip) || ZipCode.new
  zip_code.zip = zip
  zip_code.attributes = {
    city: city,
    state_abbreviation: state_abbr,
    country: country,
    latitude: lat,
    longitude: long
  }
  zip_code.save!
end

["MasterCard", "Visa", "AmericanExpress"].each do |type|
  next if PaymentType.exists?(type: type)
  payment_type = PaymentType.new
  payment_type.type = type
  payment_type.save!
end
