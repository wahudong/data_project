# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

# Electoral_ward.destroy_all
ServiceRequest.destroy_all
ElectoralWard.destroy_all
Neighbourhood.destroy_all

# Fetch and decode JSON resources from the Star Wars API by URL.
def data_fetch(url)
  JSON.parse(open(url).read)
end

data_source = data_fetch('https://data.winnipeg.ca/resource/4her-3th5.json')
data_source.each do |d|
  # puts "name: #{d['neighbourhood']}"
  ward = ElectoralWard.create(name: d['ward'],
                              mla_name: Faker::Movies::HarryPotter.character,
                              mla_add: Faker::Address.street_address)

  neighbour = Neighbourhood.create(name: d['neighbourhood'],
                                   school_division: Faker::Address.community,
                                   number_of_hospital: rand(1..3))

  ServiceRequest.create(date_time: d['sr_date'],
                        service_area: d['service_area'],
                        service_request: d['service_request'],
                        latitude: d['location_1']['latitude'],
                        longitude: d['location_1']['longitude'],
                        Electoral_ward: ward,
                        Neighbourhood: neighbour)
end

# puts ElectoralWard.all.to_s
# ElectoralWard.all.each do |e|
#   puts e.name.to_s
# end

ServiceRequest.all.each do |x|
  puts x.service_request.to_s
end

# Build the "person by id" people endpoint URL.
# def person_url(id)
#  'https://swapi.co/api/people/' + id.to_s
# end

# Format unordered dashed list of films.
# def film_title_list(films)
#   film_titles = films.map { |f| f['title'] }
#   "- " + film_titles.join(" \n            - ")
# end

# Crawl people, planets, and films API endpoints for the first 15 characters.
# character_ids = 1..15
# character_ids.each do |character_id|
#   person    = swapi_fetch(person_url(character_id))
#   homeworld = swapi_fetch(person['homeworld'])
#   films     = person['films'].map { |film_url| swapi_fetch(film_url) }

# Print out character information.
#   puts  "¸•°o.•º°    #{person['name'].ljust(18)}  °º•.o°•¸ \n\n"
#   puts  "Born:       #{person['birth_year']}"
#   print "Homeworld:  #{homeworld['name']} "
#   puts  "(Population #{homeworld['population']})"
#   puts  "Films:      #{film_title_list(films)}"
#   puts  "\n\n\n"
# end
