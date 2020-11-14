class CommentsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @comment = @board.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to board_path(id: @board.id), success: t('defaults.message.created', item: Comment.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Comment.model_name.human)
      render 'boards/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
