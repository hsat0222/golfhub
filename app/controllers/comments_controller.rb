class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.round_id = params[:id]
    if  @comment.save
      redirect_to round_path(Round.find(params[:id]))
    else
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to round_path(comment.round.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :round_id, :comment)
  end

end


