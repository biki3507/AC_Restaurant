# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 清空資料表
Category.destroy_all

# 設定種子資料
category_list = [
    { name: "中式料理" },
    { name: "日本料理" },
    { name: "義大利料理" },
    { name: "墨西哥料理" },
    { name: "素食料理" },
    { name: "美式料理" },
    { name: "複合式料理" } 
]

# 建立種子資料
category_list.each do |category|
    Category.create(name: category[:name])
end
# 提示訊息
puts "Caretory 分類標籤 has been created!"

# 順便建立 Admin 的帳號
User.create(email: "root@gmail.com",
            password: "123456",
            role: "admin")
puts "Default Admin created !"