class ActionsController < ApplicationController
    
    before_action :authenticate
    # before_action :get_action, only [:edit, :update]

    def index
        # @actions = Action.all
        if params[:user_id]
            @actions = User.find(params[:user_id]).actions
        end
    end

    def new
        @user = current_user
        @action = @user.actions.build
        # @action = Action.new
    end

    def create
       
        if params[:user_id]
            @user = User.find(id: params[:user_id])
            @action = @user.actions.build(action_params)
        byebug
            if @action.save
                redirect_to user_path(@user)
            else 
               redirect_to new_action_path
            end
        else
            @action = Action.new(action_params)
            if @action.save 
                redirect_to action_path(@action) 
            else
                render :new
                # redirect_to new_action_path
            end
        end 
    end

    def edit

    end

    def update
        @action.update(action_params)
        redirect_to action_path(@action) 
    end

    # def show
    #     @action = Action.find(params[:id])
    # end

    private

    def get_actions
        @action = Action.find(params[:id])
    end

    def action_params
        params.require(:action).permit(:user_id, :habit_id, :action_step, :start_datetime, :location, :action_time, :day, :duration_number, :duration_type)
    end
end
