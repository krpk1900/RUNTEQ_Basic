class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    @user&.deliver_reset_password_instructions!
    riderect_to login_path, success: t('.success')
  end

  def edit
  end

  def update
  end
end
