Models/Tables
user
 -name
 -username
 -email?
 -password_digest
Identity
 -title
 -description
Category?
 -name
 -type
Habit
 -title
 -description
 -frequency
 -stackable?
action
 -description
<!-- temptation bundling -->
Cue  (implementation_intention)
 -datetime
 -location
<!-- Status/progress -->
streak
 -count
 -reactionable
 -commentable
Check-in
 <!-- -belongs to a user
 -belongs to a habit -->
PACT(team or buddy)
 -name
 <!-- -habit_name -->
 -has many users
 -commentable
Badge/milestone
 -name
 -points
Reaction
 -reaction_type
Comment
 -content
Reminder
 -message
 -time
poke/nudge
new habit form
- name and description
-implemntation strategy