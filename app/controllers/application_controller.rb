class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login # sorceryが作成するメソッド。ログインしてない時not_authenticatedメソッドを発火する
  rescue_from Exception, with: :error_500
  rescue_from ActiveRecord::RecordNotFound, with: :error_404

  def error_404(e)
    ExceptionNotifier.notify_exception(e, :env => request.env, :data => {:message => "your error message"})
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  def error_500(e)
    logger.error e
    logger.error e.backtrace.join("\n\n")
    ExceptionNotifier.notify_exception(e, :env => request.env, :data => {:message => "your error message"})
    render file: "#{Rails.root}/public/500.html", layout: false, status: 500
  end

  private

  def not_authenticated
    redirect_to login_url, warning: t('defaults.message.require_login')
  end
end
