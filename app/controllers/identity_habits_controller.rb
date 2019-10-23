class IdentityHabitsController < ApplicationController

    def create
        # byebug
        identity_habit = IdentityHabit.new(identity: Identity.find(params[:identity_habit][:identity_id]), habit: Habit.find(params[:habit_id]))

        if identity_habit.save

            redirect_to identity_habits_path(identity_habit)
        else
            flash[:danger] = "Habit was not linked to identity, please try again"
            redirect_to habit_path(params[:habit_id])
        end
    end

    def destroy
        # identity_habit = IdentityHabit.new(identity: params[:identity_id], habit: Habit.find(params[:habit_id]))
        # if identity_habit.save
        #     redirect_to identity_habits_path(@identity.id)
        # else
        #     flash[:danger] = "Habit was not saved, please try again"
        #     redirect_to habit_path(params[:habit_id])
        # end
    end
end
