class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy update]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
  end

  def destroy
    @comment.destroy!
  end

  def update
    if @comment.update(comment_update_params)
      render json: @comment
    else
      render status: 422
    end
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end
end
