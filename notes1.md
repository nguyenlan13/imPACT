#User
has_many :user_identities
has_many :identities, through: :user_identities
has_many :habits, through: :identities
has_many :actions

#Action
belongs_to :user

#Habit
has_many :actions
has_many :users, through: :identities
has_many :identity_habits
has_many :identities, through: :identity_habits

#Identity
has_many :identity_habits
has_many :habits, through: identity_habits
has_many :user_identities
has_many :users, through: :user_identites

#User_identity
belongs_to :user
belongs_to :identity

#identity_habit
belongs_to :identity
belongs_to :habit
