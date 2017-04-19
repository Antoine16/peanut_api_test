# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Credit.destroy_all
User.destroy_all


  20.times do
    new_user = User.new(
      first_name: Faker::Name.first_name,
      last_name:  Faker::Name.last_name,
      address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      phone:  Faker::PhoneNumber,
      email:  Faker::Internet.email,
      password: '123456',
      )
      new_user.save!

      20.times do
        credit = Credit.new(
        amount_cents: Faker::Number.between(1, 200),
        state: 'pending',
        #interest_cents: Faker::Number.between(1, 20),
        refund_at: Date.today + 1,
        user: new_user,
        )
        credit.save!
      end

  end



