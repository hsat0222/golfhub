class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @round = Round.find(params[:id])
    # @comment = Comment.new(comment_params)
    @round.comments.build([{user_id: current_user.id, round_id: @round.id}])
    if  @comment.save
    redirect_to round_path(@round)
    else
    render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to round_path(comment.round)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :round_id, :comment)
  end

end


