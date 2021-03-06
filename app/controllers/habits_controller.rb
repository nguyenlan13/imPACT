class HabitsController < ApplicationController

    before_action :authenticate

    def index
        current_user
        if params[:user_id]
            @habits = User.find(params[:user_id]).habits
        elsif params[:identity_id]
            @habits = Identity.find(params[:identity_id]).habits
        else
            @habits = Habit.all
        end
    end

    def new
        # if params[:identity_id] && !Identity.exists?(params[:identity_id])
        #     redirect_to identities_path, alert: "Identity not found."
        # else
        #     @habit = Habit.new(identity_id: params[:identity_id])
        # end
        # @user = current_user
        @habit = Habit.new
    end

    def create
        @habit = Habit.new(habit_params)
        if @habit.save 
            redirect_to habit_path(@habit)
        else
            flash[:danger] = "Habit was not saved! Please try again."
            render :new
        end
    end

    def show
        @user = current_user
        @habit = Habit.find(params[:id])
        @step = @habit.steps.build
        @commentable = @habit
    end

    def habit_params
        params.require(:habit).permit(:build, :title, :frequency_number, :frequency)
    end
end
