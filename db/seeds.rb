# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.find_or_initialize_by(email: 'dasly@gmail.com')
user1.password= 'password'
# user1.admin = true
user1.password_confirmation= 'password'
user1.save

user2 = User.find_or_initialize_by(email: 'midory@gmail.com')
user2.password= 'password'
# user2.admin = true
user2.password_confirmation= 'password'
user2.save

user3 = User.find_or_initialize_by(email: 'stephani@gmail.com')
user3.password= 'password'
user3.password_confirmation= 'password'
user3.save

category1 = Category.find_or_initialize_by(name: 'verduras')
category1.save
category2 = Category.find_or_initialize_by(name: 'frutas')
category2.save
category3 = Category.find_or_initialize_by(name: 'carnes')
category3.save

product1 = Product.find_or_initialize_by(title: 'zanahoria',
            code: '001', price: 5, stock: 20,
            description: 'Quot semper vivendo ad vix, qui ad diam lucilius repudiare. Autem voluptua ius id. Invenire antiopam qualisque ne per, ei vim legimus accusam, tale nulla vim ut', category: category1)
product1.save
product2 = Product.find_or_initialize_by(title: 'uvas',
            code: '002', price: 3, stock: 40,
            description: 'Quot semper vivendo ad vix, qui ad diam lucilius repudiare. Autem voluptua ius id. Invenire antiopam qualisque ne per, ei vim legimus accusam, tale nulla vim ut', category: category2)
product2.save
product3 = Product.find_or_initialize_by(title: 'jengibre',
            code: '011', price: 8, stock: 23,
            description: 'Quot semper vivendo ad vix, qui ad diam lucilius repudiare. Autem voluptua ius id. Invenire antiopam qualisque ne per, ei vim legimus accusam, tale nulla vim ut', category: category1)
product3.save
product4 = Product.find_or_initialize_by(title: 'berenjena',
            code: '012', price: 9, stock: 10,
            description: 'Quot semper vivendo ad vix, qui ad diam lucilius repudiare. Autem voluptua ius id. Invenire antiopam qualisque ne per, ei vim legimus accusam, tale nulla vim ut', category: category1)
product4.save
product5 = Product.find_or_initialize_by(title: 'manzana',
            code: '021', price: 4, stock: 35,
            description: 'Quot semper vivendo ad vix, qui ad diam lucilius repudiare. Autem voluptua ius id. Invenire antiopam qualisque ne per, ei vim legimus accusam, tale nulla vim ut', category: category2)
product5.save
product6 = Product.find_or_initialize_by(title: 'cebolla',
            code: '022', price: 2, stock: 37,
            description: 'Quot semper vivendo ad vix, qui ad diam lucilius repudiare. Autem voluptua ius id. Invenire antiopam qualisque ne per, ei vim legimus accusam, tale nulla vim ut', category: category1)
product6.save
product7 = Product.find_or_initialize_by(title: 'limon',
            code: '031', price: 3, stock: 40,
            description: 'Quot semper vivendo ad vix, qui ad diam lucilius repudiare. Autem voluptua ius id. Invenire antiopam qualisque ne per, ei vim legimus accusam, tale nulla vim ut', category: category1)
product7.save
product8 = Product.find_or_initialize_by(title: 'kiwi',
            code: '032', price: 9, stock: 15,
            description: 'Quot semper vivendo ad vix, qui ad diam lucilius repudiare. Autem voluptua ius id. Invenire antiopam qualisque ne per, ei vim legimus accusam, tale nulla vim ut', category: category2)
product8.save
product9 = Product.find_or_initialize_by(title: 'repollo',
            code: '033', price: 4, stock: 13,
            description: 'Quot semper vivendo ad vix, qui ad diam lucilius repudiare. Autem voluptua ius id. Invenire antiopam qualisque ne per, ei vim legimus accusam, tale nulla vim ut', category: category1)
product9.save
product10 = Product.find_or_initialize_by(title: 'durazno',
            code: '034', price: 5, stock: 8,
            description: 'Quot semper vivendo ad vix, qui ad diam lucilius repudiare. Autem voluptua ius id. Invenire antiopam qualisque ne per, ei vim legimus accusam, tale nulla vim ut', category: category2)
product10.save
