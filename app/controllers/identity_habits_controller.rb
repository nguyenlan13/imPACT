class IdentityHabitsController < ApplicationController
    
    before_action :authenticate

    def create
        identity_habit = IdentityHabit.new(identity: Identity.find(params[:identity_habit][:identity_id]), habit: Habit.find(params[:habit_id]))
        if identity_habit.save
            redirect_to(request.env['HTTP_REFERER'])
            # redirect_to identity_habits_path(identity_habit)
        else
            flash[:danger] = "This habit is already linked to this identity."
            redirect_to(request.env['HTTP_REFERER'])
            # redirect_to habit_path(params[:habit_id])
        end
    end

    def destroy
        identity_habit = IdentityHabit.find_by(habit: params[:habit_id], identity: params[:identity_id])
        if identity_habit.delete
            redirect_to(request.env['HTTP_REFERER'])
        else
            flash[:danger] = "Sorry, could not unlink."
            redirect_to(request.env['HTTP_REFERER'])
        end
    end
end
