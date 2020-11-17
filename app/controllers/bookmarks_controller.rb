class BookmarksController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    current_user.bookmark(@board)
    flash.now[:success] = t('.success')
    # redirect_back fallback_location: root_path, success: t('.success')
  end

  def destroy
    @board = current_user.bookmarks.find(params[:id]).board
    current_user.unbookmark(@board)
    flash.now[:success] = t('.success')
    # redirect_back fallback_location: root_path, success: t('.success')
  end
end
