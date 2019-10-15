# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#user
lan = User.create(name: "Lan", username: "lnguyen", password: "password")
new_dev = User.create(name: "New_Dev", username: "newbie", password: "password")

#identity
amazing_programmer = Identity.create(pact_name: "coding_newbies", description: "I am an amazing programmer")

#habit
programming_habit = Habit.create(title: "Programming", description: "work on a coding challenge", frequency: "daily")

#user_identity
user_ident = UserIdentity.create(user: lan, identity: amazing_programmer)

#identity_habit
id_habit = IdentityHabit.create(identity: amazing_programmer, habit: programming_habit)

#action
programmer_action = Action.create(user: lan, action_step: "I will work on a coding challenge", start_datetime: "before work", location: "at home", duration: "2 hours")

#pact
# pact1 = Pact.create(name: "coding_newbies")

#streak
pact1_streak = Streak.create(habit:programming_habit, current_streak: 5, longest_streak: 7)

#user_pact
# UserPact.create(user: lan, pact: pact1)
# UserPact.create(user: new_dev, pact: pact1)

#comment
Comment.create(user: lan, content: "Yay!!", commentable: amazing_programmer)

#reaction

