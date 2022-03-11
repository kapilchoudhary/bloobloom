# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

frame1 = Frame.create([{name: 'Round',description: 'First frame', status: 1 ,stock: 45, price: 567.4}])
frame2 = Frame.create([{name: 'Rectangle',description: 'Test-frame', status: 0 ,stock: 45, price: 1500.0}])
frame3 =Frame.create([{name: 'Aviator',description: 'Test-frame', status: 0 ,stock: 45, price: 1500.0}])

lense1 = Lense.create([{color: 'Blue', description: 'First lenes to test', prescription_type: 1 , lens_type: 0, stock: 45, price: 567.4}])
lense2 = Lense.create([{color: 'Black', description: 'Second lenes to test', prescription_type: 2, lens_type: 1, stock: 445, price: 2000}])
lense3 = Lense.create([{color: 'Red', description: 'Second lenes to test', prescription_type: 0, lens_type: 1, stock: 50, price: 2530}])

user1 = User.create(first_name:"Test", last_name:"User",username: "Bloobloom", password: "Qwerty123", admin:true, email:"first@test.com")
user2 = User.create(first_name:"Test", last_name:"Two",username: "bloobloomglasses", password: "Qwerty123", email:"user@bloobloom.com", admin:false, currency:0)