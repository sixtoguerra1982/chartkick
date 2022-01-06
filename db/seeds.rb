# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Products
# ________________________________
# id 
# name -> Faker::Coffee.blend_name
# unit_price -> ($1.990y los $5.490)
# origin
# variety


# Sales 1096 (3288) registros 1 por dia pensando 3 años desde 2019-2021 , minimo 3 ventas dias ()
# ________________________________
# id 
# date
# product_id
# quantity
# price


# 100.times do |i|
#     Product.create(name: Faker::Coffee.blend_name, unit_price:rand(1990..5490), origin: Faker::Coffee.origin, variety: Faker::Coffee.variety)
# end

productos = Product.all
inicio = "01-01-2019".to_date
fin = "31-12-2021".to_date
rango = (inicio..fin).to_a
rango.each do |day|
    puts day
    3.times do |i|
        producto = productos.sample
        Sale.create!(date: day,product: producto,quantity: rand(1..5), price: producto.unit_price)
    end
end
