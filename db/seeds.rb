# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

p "Start seeding..."

User.destroy_all

p "Destroyed done!"

user = User.new
user.email = 'thibaut@87seconds.com'
# user.name = Faker::Name.name
user.password = '123456'
user.password_confirmation = '123456'
user.save!
p "User created"

# Mot1 - Onboarding
  mot1 = Mot.new(
    name: "Onboarding Kate",
    description: "Kate starts as full time marketer after her internship with Silvio. Make sure to give her warm welcome. She has 2 girls aged 3 and a dog named Dingo.",
    duedate: Faker::Date.forward(days: 200),
    tag: "HR",
    emoticon: "👋",
    user: user
  )
  mot1.save!
      task1 = Task.new(
        name: "Send & collect admin documents",
        delay: -7,
        description: "There is a shotload of things you shouldn't forget: ID, payroll, insurance, car company, badge, transportation etc",
        completed: true,
        mot: mot1
      )
      task1.save!
      task2 = Task.new(
        name: "Wish a warm welcome !",
        delay: 0,
        description: "Message from the HR dep: we won't find a second Kate.. You better keep her on board!!",
        completed: false,
        mot: mot1
      )
      task1.save!
          trigger1 = Trigger.new(
            name: "Insurance contracts",
            url: Faker::Internet.domain_name,
            task: task1
          )
                task1.save!
          trigger2 = Trigger.new(
            name: "Mail with ID and payroll info",
            url: "Hey Kate. It's D-7 before your start. We're thrilled to have you on board! Could you send us a copy of your ID and the info of your bank account. Best is you fill the document attached! Thanks and see you sooon :-)",
            feature: "mail",
            task: task1
          )
          trigger2.save!
          trigger3 = Trigger.new(
            name: "Prepare laptop, goodies, etc",
            url: "just do it!",
            feature: "mail",
            task: task2
          )
          trigger3.save!
          trigger4 = Trigger.new(
            name: "Set up company email",
            url: "Hey Jo (the It guy). Could you create an email for Kate Middleton our new Marketer? Her email is kate_theduchess_of_cambridge@royal.uk Much appreciated!",
            feature: "slack",
            task: task2
          )
          trigger4.save!


# 4.times do
#   mot = Mot.new(
#     name: ["Onboarding Sylvia", "Q3 Closing", "Review Elisabeth", "Budget 2021"].sample,
#     description: Faker::GreekPhilosophers.quote,
#     duedate: Faker::Date.forward(days: 200),
#     tag: ["HR", "Finance", "Operations", "Admin", "Sales"].sample,
#     emoticon: ["😃", "💁", "🐻", "🌻","🍔", "🍹", "🎷", "⚽️","🚘", "🏳️‍🌈", "🎉", "💡"].sample,
#     user: user
#   )

# p "Mot created"

#   mot.save!
#     rand(1..5).times do
#       task = Task.new(
#         name: Faker::Company.bs,
#         delay: rand(1..100),
#         description: Faker::Marketing.buzzwords,
#         priority: Faker::Boolean,
#         mot: mot
#       )

#    p "Task created"

#       task.save!
#         rand(1..2).times do
#           trigger = Trigger.new(
#             name: Faker::Company.catch_phrase,
#             url: Faker::Internet.domain_name,
#             task: task
#           )
#           trigger.save!
#         end
# p "Trigger created"
#     end
