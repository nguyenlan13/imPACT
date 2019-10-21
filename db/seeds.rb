# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#user
lan = User.create(email: "lan@impact.com", name: "Lan", username: "lnguyen", password: "password")
new_dev = User.create(email: "new_dev@impact.com", name: "New_Dev", username: "Newbie", password: "password")

#identity
great_programmer = Identity.create(pact_name: "Coding Warriors", description: "Great Programmer")
athletic_person = Identity.create(pact_name: "Fitness Junkies", description: "Athlete")

#habit
programming_habit = Habit.create(build: true, title: "Code", frequency_number: 1, frequency: "Daily")
sleeping = Habit.create(build: true, title: "Sleep", frequency_number: 1, frequency: "Daily")
junk = Habit.create(build: false, title: "Junk Food", frequency_number: 2, frequency: "Daily")

#user_identity
user_ident = UserIdentity.create(user: lan, identity: great_programmer)
user_ident2 = UserIdentity.create(user: new_dev, identity: great_programmer)
user_ident3 = UserIdentity.create(user: lan, identity: athletic_person)

#identity_habit
id_habit = IdentityHabit.create(identity: great_programmer, habit: programming_habit)
id_habit2 = IdentityHabit.create(identity: great_programmer, habit: sleeping)
id_habit3 = IdentityHabit.create(identity: athletic_person, habit: junk)


#action
programmer_action = Action.create(user: lan, habit: programming_habit, action_step: "Work on a Coding Challenge", start_datetime: "Before Work", location: "Home", duration_number: 2, duration_type: "hours")
skinny_actions = Action.create(user: lan, habit: junk, action_step: "Will not eat candy", start_datetime: "After Work", location: "Home")
sleep_actions = Action.create(user: lan, habit: sleeping, action_step: "Go to sleep", start_datetime: "After Work", location: "Home", duration_number: 6, duration_type: "hours")

#pact
# pact1 = Pact.create(name: "coding_newbies")

#streak
pact1_streak = Streak.create(user: lan, habit: programming_habit, current_streak: 5, longest_streak: 7)
pact2_streak = Streak.create(user: lan, habit: junk, current_streak: 8, longest_streak: 10)
#user_pact
# UserPact.create(user: lan, pact: pact1)
# UserPact.create(user: new_dev, pact: pact1)

#comment
Comment.create(user: lan, content: "Yay!!", commentable: great_programmer)
Comment.create(user: lan, content: "Nice!!", commentable: athletic_person)
#reaction

