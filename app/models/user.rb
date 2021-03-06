class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { within: 8..21 }, on: :create
    has_secure_password



    has_many :user_identities, dependent: :destroy
    has_many :identities, through: :user_identities
    has_many :habits, through: :identities
    has_many :steps, dependent: :destroy
    has_many :streaks, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :reactions, dependent: :destroy



    def self.g_random_code(number)
        array = Array('A'..'Z') + Array('a'..'z')
        Array.new(number) { array.sample }.join
    end      

    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |user|

            user.email = auth.info.email
            user.username = auth.info.name + rand(1..1000).to_s
            user.name = auth.info.name
            password = self.g_random_code(19)
            user.password = password

        end
    end

    # def self.user_with_most_habits(habit)
    #     where(habits: )
    # end
    

    #   has_many :comments, as: :commentable

    #   accepts_nested_attributes_for :identities

    #   def identities_attributes=(identity_attributes)
    #     identity_attributes.values.each do |identity_attribute|
    #         identity = Identity.find_or_create_by(identity_attribute)
    #         self.identities << identity
    #     end
    #   end
    end
