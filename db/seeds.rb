# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  {
    first_name: 'Administrator', 
    last_name: '', 
    email: 'admin@avenor.ro', 
    phone: '', 
    password: 'Avenor', 
    password_confirmation: 'Avenor', 
    grade: 1, 
    position: 2,
    admin: true
  },
])

stands = Stand.create([
  {name: 'Waffles & Pancakes', icon: 'stroopwafel', operator_id: 0},
  {name: 'Hot chocolate & tea', icon: 'mug-marshmallows', operator_id: nil},
  {name: 'Hit the Grinch', operator_id: nil}
])