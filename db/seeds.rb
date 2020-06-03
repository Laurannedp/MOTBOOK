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
    duedate: Time.new(2020,06,01),
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
                  trigger1 = Trigger.new(
                        name: "Insurance contracts",
                        url: "Hey Like. Could you prepare the insurance shzzzl for Kate?",
                        task: task1
                      )
                  trigger1.save!
                 trigger2 = Trigger.new(
                      name: "Mail with ID and payroll info",
                      url: "Hey Kate. It's D-7 before your start. We're thrilled to have you on board! Could you send us a copy of your ID and the info of your bank account. Best is you fill the document attached! Thanks and see you sooon :-)",
                      feature: "mail",
                      task: task1
                    )
                  trigger2.save!
      task2 = Task.new(
        name: "Wish a warm welcome !",
        delay: 0,
        description: "Message from the HR dep: we won't find a second Kate.. You better keep her on board!!",
        completed: false,
        mot: mot1
      )
      task2.save!
          trigger3 = Trigger.new(
            name: "Prepare laptop, goodies, etc",
            url: "Just do it!",
            feature: "mail",
            task: task2
          )
          trigger3.save!
          trigger4 = Trigger.new(
            name: "Set up company email",
            url: "Hey Jo (the It guy). ``` Could you create an email for Kate Middleton our new Marketer?``` Her email is kate_theduchess_of_cambridge@royal.uk``` Much appreciated!",
            # icon_url: "https://i0.wp.com/metroboulotpinceaux.com/wp-content/uploads/2016/03/Favicon-Heart.png"
            feature: "slack",
            task: task2
          )
          trigger4.save!

      task3 = Task.new(
        name: "Launch training program",
        delay: 3,
        description: "Classical maketer program with focus on digital tool.",
        completed: false,
        mot: mot1
      )
      task3.save!
          trigger5 = Trigger.new(
            name: "Training program 1",
            url: "Catherina could you add kate to your training program ?",
            feature: "mail",
            task: task3
          )
          trigger5.save!

     task4 = Task.new(
        name: "Chek how new colleague is doing (so far).",
        delay: 5,
        description: "It's been 5 days Kate is on baord, good time for a first check",
        completed: false,
        mot: mot1
      )
      task4.save!
          trigger6 = Trigger.new(
            name: "5 days check reminder",
            url: "Don't forget this!",
            feature: "slack",
            task: task4
          )
          trigger6.save!
      task5 = Task.new(
        name: "2nd part of the training",
        delay: 7,
        description: "Chek how Kate is doing (so far).",
        completed: false,
        mot: mot1
      )
      task5.save!
          trigger7 = Trigger.new(
             name: "Training program 2",
            url: "Catherina could you add kate to your training program ?",
            feature: "mail",
            task: task5
          )
          trigger7.save!
      task6 = Task.new(
        name: "Organise welcome drink",
        delay: 14,
        description: "Usual Thursday drink in the honor of the new colleague",
        completed: false,
        mot: mot1
      )
      task6.save!
          trigger8 = Trigger.new(
            name: "Welcome drink organisaion",
            url: "Mike could you set up a welcome drink for our new recruit?",
            feature: "mail",
            task: task6
          )
          trigger8.save!
p "Mot 1 created"


  mot2 = Mot.new(
    name: "HBDY to colleagues",
    description: "To each and every one!",
    duedate: Time.new(2020,01,01),
    tag: "Team",
    emoticon: "🎂",
    user: user
  )
  mot2.save!
  4.times do
      task = Task.new(
        name: "Happy birthday " + Faker::Name.first_name,
        delay: rand(1..365),
        description: "Make sure to call and sing for you colleague ! Or bring a cake. Or both :-)",
        priority: Faker::Boolean,
        mot: mot2
      )
      task.save!
          trigger = Trigger.new(
            name: "Happy birthday to you !!",
            url: "Happy birthdayyy to youuuuu... ",
            task: task
          )
          trigger.save!
  end
        task = Task.new(
        name: "Happy birthday Pietro",
        delay: 156,
        description: "Happy to you Pietro! :-)",
        priority: Faker::Boolean,
        mot: mot2
      )
      task.save!
          trigger = Trigger.new(
            name: "Happy birthday to you !!",
            url: "Happy birthdayyy to youuuuu... ",
            task: task
          )
          trigger.save!
p "Mot 2 created"

  mot3 = Mot.new(
    name: "Mid year teambuilding",
    description: "Let's make it wild",
    duedate: Time.new(2020,07,04),
    tag: "Team",
    emoticon: "🎉",
    user: user
  )
  mot3.save!
      task1 = Task.new(
        name: "Send invites to all colleagues",
        delay: -30,
        description: "",
        priority: Faker::Boolean,
        mot: mot3
      )
      task1.save!
      task2 = Task.new(
        name: "Book restaurant",
        delay: -20,
        description: "",
        priority: Faker::Boolean,
        mot: mot3
      )
      task2.save!
      task3 = Task.new(
        name: "Write NYE speech",
        delay: -10,
        description: "",
        priority: Faker::Boolean,
        mot: mot3
      )
      task3.save!
      task4 = Task.new(
        name: "NYE celebrations",
        delay: 0,
        description: "",
        priority: Faker::Boolean,
        mot: mot3
      )
      task4.save!

p "Mot 3 created"

  # mot4 = Mot.new(
  #   name: "Date my secretary",
  #   description: "This is a secret task",
  #   duedate: Time.new(2021,01,01),
  #   tag: "HR",
  #   emoticon: "🎉",
  #   user: user
  # )
  # mot4.save!
  #     task1 = Task.new(
  #       name: "Mail to secretary to set up meeting tmr 8pm",
  #       delay: -1,
  #       description: "🍌",
  #       priority: Faker::Boolean,
  #       mot: mot4
  #     )
  #     task1.save!
  #     task2 = Task.new(
  #       name: " I'll be late honey!",
  #       delay: 0,
  #       description: "",
  #       priority: Faker::Boolean,
  #       mot: mot4
  #     )
  #     task2.save!
  # p "Mot 4 created"


  mot5 = Mot.new(
    name: "Review " + Faker::Name.first_name,
    description: "Annual reviews to be organised",
    duedate: Faker::Date.forward(days: 200),
    tag: "HR",
    emoticon: "😃",
    user: user
  )
  mot5.save!

p "Mot 5 created"

  mot6 = Mot.new(
    name: "Q2 closing",
    description: "Financial reporting to be sent to CFO",
    duedate: Time.new(2020,06,30),
    tag: "Finance",
    emoticon: "💡",
    user: user
  )
  mot6.save!
        task1 = Task.new(
        name: "VAT documents",
        delay: -28,
        description: "",
        priority: Faker::Boolean,
        mot: mot6
      )
      task1.save!
      task2 = Task.new(
        name: "Reporting by BU",
        delay: -29,
        description: "",
        priority: Faker::Boolean,
        mot: mot6
      )

p "Mot 6 created"

# 4.times do
#   mot = Mot.new(
#     name: ["Onboarding Sylvia", "Q3 Closing", "Review Elisabeth", "Budget 2021"].sample,
#     description: Faker::GreekPhilosophers.quote,
#     duedate: Faker::Date.forward(days: 200),
#     tag: ["HR", "Finance", "Operations", "Admin", "Sales"].sample,
#     emoticon: ["😃" 👋, "💁", "🐻", "🌻","🍔", "🍹", "🎷", "⚽️","🚘", "🏳️‍", "🌈", "🎉", "💡"].sample,
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
