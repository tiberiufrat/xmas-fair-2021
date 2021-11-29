# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  {first_name: 'Tiberiu', last_name: 'Frățilă', email: 'tiberiu.fratila@gmail.com', phone: '0758043386', password: 'password', password_confirmation: 'password', grade: 0, position: 2},
  {first_name: 'Andrei', last_name: 'Oprșan', email: 'andrei.oprisan@gmail.com', password: 'password', password_confirmation: 'password', grade: 0, department: 0, position: 1},
  {first_name: 'Ana-Caterina', last_name: 'Ciușcă', email: 'ana-caterina.ciusca@gmail.com', password: 'password', password_confirmation: 'password', grade: 0, position: 2},
  {first_name: 'Maria', last_name: 'Buligoanea', email: 'maria.buligoanea@gmail.com', password: 'password', password_confirmation: 'password', grade: 2, position: 3}
])

stands = Stand.create([
  {name: 'Waffles & Pancakes', icon: 'stroopwafel', operator_id: 0},
  {name: 'Hot chocolate & tea', icon: 'mug-marshmallows', operator_id: 1},
  {name: 'Hit the Grinch', operator_id: 2}
])