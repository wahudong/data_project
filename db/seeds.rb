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
  neighbour = Neighbourhood.find_or_create_by(name: d['neighbourhood']) do |x|
    x.school_division = Faker::Address.community,
                        x.number_of_hospital = rand(1..3)
  end

  # puts (d['ward']).to_s + '//////////////////////////////////////'
  ward = ElectoralWard.find_or_create_by(name: d['ward']) do |x|
    x.mla_name = Faker::Movies::HarryPotter.character,
                 # x.mla_name = 'sample name',
                 x.mla_add = Faker::Address.street_address
  end

  # 有时候导入的electoral_ward或者neighbourhood数据是空的，这时候就需要人为的创建一个内容为“No data”的记录用于生成下面的service_request记录。会出错。
  # if ward.nil?
  #   ward = ElectoralWard.create(name: 'No data',
  #                               mla_name: 'No data',
  #                               mla_add: 'No data')
  # end

  # if neighbour.nill?
  #   neighbour = Neighbourhood.create(name: 'No data',
  #                         school_division: 'No data',
  #                     number_of_hospital: 'No data')
  # end

  ServiceRequest.create(date_time: d['sr_date'],
                        service_area: d['service_area'],
                        service_request: d['service_request'],
                        latitude: d['location_1']['latitude'],
                        longitude: d['location_1']['longitude'],
                        Electoral_ward: ward,
                        Neighbourhood: neighbour)
end

puts 'Total electoral ward created: ' + ElectoralWard.all.count.to_s
puts 'Total Service requests created: ' + ServiceRequest.all.count.to_s
puts 'Total neighbourhood created: ' + Neighbourhood.all.count.to_s

# puts ElectoralWard.all.to_s

# ElectoralWard.all.each do |e|
#   e.service_requests.each do |s|
#     puts s.service_request.to_s
#   end
# end

# ServiceRequest.all.each do |x|
#   puts x.Electoral_ward.name.to_s
# end

# ServiceRequest.all.each do |x|
#   puts x.latitude.to_s
# end
