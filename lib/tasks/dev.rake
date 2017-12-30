namespace :dev do
  task fake: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample,
        remote_image_url: 'https://visualhunt.com/photos/l/7/architecture-store-building.jpg'
      )
    end
    puts "餐廳資料成功建立"
    puts "You have #{Restaurant.count} restaurants data"
  end
end