class StepsController < ApplicationController
    
    before_action :authenticate
    # before_action :get_action, only [:edit, :update]

    def index
        @user = current_user
        if params[:habit_id]
            # @habit = Habit.find(params[:habit_id])
            # @steps = @habit.steps
            @steps = Habit.find(params[:habit_id]).steps
            # @step.user = current_user
        # else
        #     @steps = Step.all
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
                redirect_to user_steps_path(current_user)
                # redirect_to habit_steps_path(@habit)
            else
                flash[:danger] = "Action was not saved, please try again."
                render :new
            end
        # else
        #     @step = Step.new(step_params)
        #     if @step.save 
        #         redirect_to step_path(@step) 
        #     else
        #         render :new
        #         # redirect_to new_action_path
        #     end
        end 
    end

    def edit
        @step = Step.find(params[:id])
        render :edit
        # if params[:habit_id]
        # @user = current_user  
        # @habit = Habit.find(params[:habit_id])
        # # # @step = @habit.steps.build
        # @step = @habit.steps.find(params[:id])
        # @user = current_user  
        # @habit = Habit.find(params[:habit_id])
        # @step = @habit.steps.build
        # end
    end

    def update
        @step.update(step_params)
        byebug
        if @step.save
            redirect_to user_steps_path(current_user)
            # redirect_to habit_steps_path(@habit)
        else
            flash[:danger] = "Action was not updated, please try again."
            render :edit
        end
        # redirect_to habit_steps_path(@habit)
    end

    def show
        @step = Step.find(params[:id])
    end

    def destroy
        @step = Step.find(params[:id])
        @step.delete
    end

    private

    def get_actions
        @step = Step.find(params[:id])
    end

    def step_params
        params.require(:step).permit(:user_id, :habit_id, :action_step, :before, :start_datetime, :location, :action_time, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :duration_number, :duration_type)
    end
end
