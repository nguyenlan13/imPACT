class HabitsController < ApplicationController

    before_action :authenticate
        # before_action :authorize[]

    def index
        @habits = Habit.all
    end

    def new
        # if params[:identity_id] && !Identity.exists?(params[:identity_id])
        #     redirect_to identities_path, alert: "Identity not found."
        # else
        #     @habit = Habit.new(identity_id: params[:identity_id])
        # end
        @habit = Habit.new
        # @habit.identity_habits.build
    end

    def create
  
        if params[:user_id]
            @user = User.find(id: params[:user_id])
            @habit = @user.habits.build(habit_params)
            if @habit.save
                redirect_to user_path(@user)
            else
                flash[:danger] = "Habit was not saved!"
               redirect_to new_habit_path
            end
        else
            @habit = Habit.new(habit_params)
            if @habit.save 
                redirect_to habit_path(@habit) 
            else
                redirect_to new_habit_path
            end
        end
    end


    # def create

    #     @habit = Habit.identity_habits.build(habit_params)
    #     if @habit.save 
    #         redirect_to habit_path(@habit) 
    #     else
    #         redirect_to new_habit_path
    #     end
    # end

    def edit

    end

    def update

    end

    def show
        @habit = Habit.find(params[:id])
        @commentable = @habit
    end

    def habit_params
        params.require(:habit).permit(:build, :title, :frequency_number, :frequency)
    end
end
