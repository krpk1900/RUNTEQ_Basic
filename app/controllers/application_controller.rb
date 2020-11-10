class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login # sorceryが作成するメソッド。ログインしてない時not_authenticatedメソッドを発火する

  private

  def not_authenticated
    redirect_to login_url, alert: 'Please login first'
  end
end
