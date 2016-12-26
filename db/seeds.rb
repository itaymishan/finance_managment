
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ExchangeRate.find_or_create_by(from: 'CAD', to: 'ILS') do |ex|
  ex.rate = 3.0
end

ExchangeRate.find_or_create_by(from: 'ILS', to: 'CAD') do |ex|
  ex.rate = 0.3
end

ExchangeRate.find_or_create_by(from: 'USD', to: 'ILS') do |ex|
  ex.rate = 3.6
end
