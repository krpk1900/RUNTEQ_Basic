class Admin::UsersController < Admin::BaseController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :avatar, :role)
  end
end
