class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
      render :show#, danger: t('defaults.message.not_updated', item: User.model_name.human)
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password, :password_confirmation, :avatar)
  end
end
