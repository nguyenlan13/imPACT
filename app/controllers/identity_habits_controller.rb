class IdentityHabitsController < ApplicationController

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
        IdentityHabit.find(params[:id]).destroy
        # identity = Identity.find(params[:id]
        # # identity.identity_habits.find(params[:identity_habit_id]).destroy
        # IdentityHabit.find(identity.id, habit.id).destroy
        redirect_to(request.env['HTTP_REFERER'])
    end
end
