class HabitsController < ApplicationController

    def index
        @habit = Habit.all
    end

    def new
        if params[:identity_id] && !Identity.exists?(params[:identity_id])
            redirect_to identities_path, alert: "Identity not found."
        else
            @habit = Habit.new(identity_id: params[:identity_id])
        end
    end

    def create

    end

    def habit_params
        params.require(:habit).permit(:title, :description, :identity_id)
    end
end
