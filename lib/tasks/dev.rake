namespace :dev do
  task fake: :environment do
    Restaurant.destroy_all
    500.times do |i|
      Restaurant.create!(
        name: "restaurant#{i.to_s}",
        opening_hours: "11:00",
        tel: "02-1234-567#{i.to_s}",
        address: "my_address",
        description: "Restaurant description"
      )
    end
  puts "成功建立餐廳資料"
  puts "現在，你有#{Restaurant.count}筆資料了。"
  end
end