class StepsController < ApplicationController
    
    before_action :authenticate
    # before_action :get_step, only [:edit, :update]

    def index
        @user = current_user
        if params[:user_id]
            @steps = User.find(params[:user_id]).steps
        else params[:habit_id]
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
                # redirect_to user_steps_path(current_user)
                redirect_to habit_steps_path(@habit)
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
        @user = current_user  
        @habit = Habit.find(params[:habit_id])
        @step = @habit.steps.find(params[:id])
    end

    def update
        @user = current_user 
        @habit = Habit.find(params[:habit_id])
        @step = @habit.steps.find(params[:id])
        if @step.update(step_params)
        # if @step.save
            # redirect_to user_steps_path(current_user)
            redirect_to habit_steps_path(@habit)
        else
            flash[:danger] = "Action step was not updated, please try again."
            render :edit
        end
        # redirect_to habit_steps_path(@habit)
    end

    def show
        @step = Step.find(params[:id])
    end

    def destroy
       @step = Step.find(params[:id])
       if @step.delete
            redirect_to(request.env['HTTP_REFERER'])
       else
            flash[:danger] = "Action step could not be deleted"
            redirect_to(request.env['HTTP_REFERER'])
       end
    end

    private

    def get_steps
        @step = Step.find(params[:id])
    end

    def step_params
        params.require(:step).permit(:user_id, :habit_id, :action_step, :before, :start_datetime, :location, :action_time, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :duration_number, :duration_type)
    end
end
