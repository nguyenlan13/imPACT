class StepsController < ApplicationController
    
    before_action :authenticate
    # before_action :get_action, only [:edit, :update]

    def index
        # @actions = Action.all
        # if params[:user_id]
        #     @actions = User.find(params[:user_id]).actions
        # end
        @user = current_user
        if params[:habit_id]
            @actions = Habit.find(params[:habit_id]).steps
        end
    end

    def new
        @user = current_user
        @habit = Habit.find(params[:habit_id])
        @action = @habit.steps.build
        # @action = @user.actions.build
        # @action = Action.new
    end

    def create
       
        # if params[:user_id]
        #     @user = User.find(id: params[:user_id])
        #     @action = @user.actions.build(action_params)
        # byebug
        #     if @action.save
        #         redirect_to user_path(@user)
        #     else 
        #        redirect_to new_action_path
        #     end
        @user = current_user
       
            if params[:habit_id]
                @habit = Habit.find(params[:habit_id])
                @action = @habit.steps.build(step_params)
#    byebug
                if @action.save
                    redirect_to habit_steps_path(@habit)
                else 
                   redirect_to new_step_path
                end
        else
            @action = Action.new(step_params)
            if @action.save 
                redirect_to step_path(@action) 
            else
                render :new
                # redirect_to new_action_path
            end
        end 
    end

    def edit

    end

    def update
        @action.update(step_params)
        redirect_to habit_steps_path(@habit)
    end

    def show
        @action = Step.find(params[:id])
    end

    private

    def get_actions
        @action = Step.find(params[:id])
    end

    def step_params
        params.require(:step).permit(:user_id, :habit_id, :action_step, :before, :start_datetime, :location, :action_time, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :duration_number, :duration_type)
    end
end
