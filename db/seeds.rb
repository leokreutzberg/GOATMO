# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

# Clean up database
puts 'Deleting database'
Booking.destroy_all
Goat.destroy_all
User.destroy_all

LOCATIONS = ['London', 'Edinburgh', 'Düsseldorf', 'Rabat', 'Birmingham', 'Paris']

GOAT_IMAGES = ['https://images.newscientist.com/wp-content/uploads/2019/07/09172512/205582.jpg?crop=16:9,smart&width=1200&height=675&upscale=true',
               'https://www.whitehousefarmcentre.co.uk/media/1326/goats.jpg?anchor=center&mode=crop&width=500&height=350&rnd=132061236150000000',
               'https://images2.minutemediacdn.com/image/upload/c_fill,w_720,ar_16:9,f_auto,q_auto,g_auto/shape/cover/sport/iStock-177369626-1-0e8d40eaabe65d2cb2d745ef45f09229.jpg',
               'https://godstonefarm.co.uk/wp-content/uploads/2022/02/261919860_633742021225685_5213532098424325316_n-910x1024.jpg',
               'https://www.thehappychickencoop.com/wp-content/uploads/2023/06/weird-goat-breeds-featured-image.jpg',
               'https://t4.ftcdn.net/jpg/02/88/74/77/360_F_288747705_lF8oCsASeLu8Hi8cSm4l9FqUWFvrTmy4.jpg',
               'https://www.shutterstock.com/image-photo/funny-cute-goat-260nw-1372240856.jpg',
               'https://images.pexels.com/photos/18314117/pexels-photo-18314117.jpeg?cs=srgb&dl=pexels-laurent-julien-18314117.jpg&fm=jpg',
               'https://barfblog.com/wp-content/uploads/2010/07/billy_goat_saturnine_94112_l.jpg']

image_index = 0

3.times do
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456789')
  user.save
  puts 'User created'

  3.times do
    goat = Goat.new(name: Faker::FunnyName.two_word_name, location: LOCATIONS.sample, price: rand(20..500), description: Faker::Quotes::Shakespeare.as_you_like_it_quote)
    goat.user = user

    file = URI.open(GOAT_IMAGES[image_index])
    goat.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    image_index += 1

    goat.save
    puts 'Goat created'
  end
end
