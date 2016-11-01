# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
#  file=Faker::File.file_name('path/to') #=> "path/to/something_random.jpg"
<% @photos.each do |photo| %>
Photo.create(
  title: "a",
  content: "a",
  image: File.open(
["#{Rails.root}/db/fixtures/image-1.jpg","#{Rails.root}/db/fixtures/image-2.jpg","#{Rails.root}/db/fixtures/image-3.jpg","#{Rails.root}/db/fixtures/image-4.jpg","#{Rails.root}/db/fixtures/image-5.jpg"].sample))
  <% end %>
