class ActionsController < ApplicationController
    def index
        @actions = Action.all
    end

    def new
        @action = Action.new
    end

    def create
        if params[:user_id]
            @user = User.find(id: params[:user_id])
            @action = @user.actions.build(action_params)
            if @action.save!
                redirect_to user_path(@user)
            else 
               redirect_to new_action_path
            end
        else
            @action = Action.new(action_params)
            if @action.save 
                redirect_to action_path(@action) 
            else
                redirect_to new_action_path
            end
        end 
    end

    # def edit

    # end

    def show
        @action = Action.find(params[:id])
    end

    def action_params
        params.require(:action).permit(:user_id, :habit_id, :action_step, :start_datetime, :location, :duration)
      end

end
