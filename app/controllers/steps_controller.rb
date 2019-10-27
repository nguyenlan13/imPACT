class StepsController < ApplicationController
    
    before_action :authenticate
    # before_action :get_action, only [:edit, :update]

    def index
        @user = current_user
        if params[:habit_id]
            @steps = Habit.find(params[:habit_id]).steps
        end
    end

    def new
        @user = current_user  
        @habit = Habit.find(params[:habit_id])
        @step = @habit.steps.build
     end

    def create       
        if params[:habit_id]
            @habit = Habit.find(params[:habit_id])
            @step = @habit.steps.build(step_params)
            @step.user = current_user
            if @step.save
                redirect_to habit_steps_path(@habit)
            else 
                redirect_to new_step_path
            end
        else
            @step = Step.new(step_params)
            if @step.save 
                redirect_to step_path(@step) 
            else
                render :new
                # redirect_to new_action_path
            end
        end 
    end

    def edit

    end

    def update
        @step.update(step_params)
        redirect_to habit_steps_path(@habit)
    end

    def show
        @step = Step.find(params[:id])
    end

    private

    def get_actions
        @step = Step.find(params[:id])
    end

    def step_params
        params.require(:step).permit(:user_id, :habit_id, :action_step, :before, :start_datetime, :location, :action_time, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :duration_number, :duration_type)
    end
end
