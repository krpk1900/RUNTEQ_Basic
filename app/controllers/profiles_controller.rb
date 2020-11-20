class ProfilesController < ApplicationController
  def show; end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      redirect_to profile_path, danger: t('defaults.message.not_updated', item: User.model_name.human)
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password, :password_confirmation, :avatar)
  end
end
