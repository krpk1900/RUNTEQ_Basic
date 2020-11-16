class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    bookmark.save
    redirect_to request.referer, success: t('.bookmark')
  end

  def destroy
    bookmark = Bookmark.find_by(user_id: current_user.id, board_id: params[:board_id])
    bookmark.destroy
    redirect_to request.referer, success: t('.unbookmark')
  end
end
