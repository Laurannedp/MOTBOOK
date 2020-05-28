# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

User.destroy_all

user = User.new
user.email = 'thibaut@87seconds.com'
# user.name = Faker::Name.name
user.password = '123456'
user.password_confirmation = '123456'
user.save!

4.times do
  mot = Mot.new(
    name: ["Onboarding Sylvia", "Q3 Closing", "Review Elisabeth", "Budget 2021"].sample,
    description: Faker::GreekPhilosophers.quote,
    # duedate: Faker::Date,
    tag: ["HR", "Finance", "Operations", "Admin", "Sales"].sample,
    emoticon: ["😃", "💁", "🐻", "🌻","🍔", "🍹", "🎷", "⚽️","🚘", "🏳️‍🌈", "🎉", "💡"].sample,
    user: user
  )
  mot.save!
    rand(1..5).times do
      task = Task.new(
        name: Faker::Company.bs,
        delay: rand(1..100),
        description: Faker::Marketing.buzzwords,
        priority: Faker::Boolean,
        mot: mot
      )
      task.save!
        rand(1..2).times do
          trigger = Trigger.new(
            name: Faker::Company.catch_phrase,
            url: Faker::Internet.domain_name,
            task: task
          )
          trigger.save!
        end
    end
end


