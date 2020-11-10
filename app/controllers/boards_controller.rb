class BoardsController < ApplicationController
  def new; end

  def show; end

  def index
    @boards = Board.all.includes(:user)
  end
end
