# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.find_or_initialize_by(email: 'dasly@gmail.com')
user1.password= 'password'
user1.password_confirmation= 'password'
user1.save

user2 = User.find_or_initialize_by(email: 'midory@gmail.com')
user2.password= 'password'
user2.password_confirmation= 'password'
user2.save

user3 = User.find_or_initialize_by(email: 'stephani@gmail.com')
user3.password= 'password'
user3.password_confirmation= 'password'
user3.save

category1 = Category.find_or_initialize_by(name: 'carnes')
category1.save
product1 = Product.find_or_initialize_by(title: 'pescado bonito 1k',
            code: '001', price: 10000, stock: 20,
            description: 'El atún blanco, bonito del norte', category: category1)
product1.save

product2 = Product.find_or_initialize_by(title: 'pescado jurel 1k',
            code: '002', price: 15000, stock: 40,
            description: 'El jurel chileno, jurel del Pacífico sur o, simplemente', category: category1)
product2.save


category2 = Category.find_or_initialize_by(name: 'verduras')
category2.save
product_v1 = Product.find_or_initialize_by(title: 'tomate',
            code: '011', price: 15000, stock: 23,
            description: 'tomates traidos desde chanchamayo', category: category2)
product_v1.save
product_v2 = Product.find_or_initialize_by(title: 'zanahoria',
            code: '012', price: 15000, stock: 40,
            description: 'zanahoria traidos desde chanchamayo', category: category2)
product_v2.save

category3 = Category.find_or_initialize_by(name: 'abarrotes')
category3.save
product_a1 = Product.find_or_initialize_by(title: 'leche',
            code: '021', price: 15000, stock: 35,
            description: 'leche gloria', category: category3)
product_a1.save

product_a2 = Product.find_or_initialize_by(title: 'aceite',
            code: '022', price: 15000, stock: 37,
            description: 'aceite primor', category: category3)
product_a2.save
