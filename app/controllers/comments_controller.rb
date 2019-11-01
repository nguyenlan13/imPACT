class CommentsController < ApplicationController

    before_action :authenticate
     # before_action :authorize[]

    def index
       current_user
        if params[:comment_id]
            @comment = Comment.find(params[:comment_id]).comments
        elsif params[:habit_id]
            @comment = Habit.find(params[:habit_id]).comments
        elsif params[:identity_id]
            @comment = Identity.find(params[:identity_id]).comments
        elsif params[:streak_id]
            @comment = Streak.find(params[:streak_id]).comments
        else
            @comments = Comment.all
        end
    end

    def new
        # @user = current_user
        @comment = Comment.new
    end

    def create
        if params[:comment_id]
            @commentable = Comment.find(params[:comment_id])
        elsif params[:habit_id]
            @commentable = Habit.find(params[:habit_id])
        elsif params[:identity_id]
            @commentable = Identity.find(params[:identity_id])
        else params[:streak_id]
            @commentable = Streak.find(params[:streak_id])
        end
        @comment = @commentable.comments.new(comment_params)
        @comment.user = current_user
       
        if @comment.save 
            redirect_to polymorphic_path([@commentable, @comments])
        else
            flash[:danger] = "Comment was not saved."
            redirect_to new_comment_path
        end
    end

    def edit
        @user = current_user
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
        # if @comment.save
            redirect_to polymorphic_path([@commentable, @comments])
        else
            flash[:danger] = "Comment was not updated."
            redirect_to edit_comment_path
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        # if @comment.delete
        redirect_to polymorphic_path([@commentable, @comments])
    end

     def show
        @comment = Comment.find(params[:id])
     end

     private

     def comment_params
         params.require(:comment).permit(:user_id, :content, :commentable_id, :commentable_type)
     end
end
