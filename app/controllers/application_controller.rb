class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login # sorceryが作成するメソッド。ログインしてない時not_authenticatedメソッドを発火する
  rescue_from Exception, with: :rendser_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  def not_authenticated
    redirect_to login_url, warning: t('defaults.message.require_login')
  end

  def render_404
    # ExceptionNotifier.notify_exception(error, env: request.env, data: { message: 'your error message' })
    render file: Rails.root.join('public/404.html'), layout: false, status: :not_found
  end

  def render_500(error)
    logger.error error
    logger.error error.backtrace.join("\n")
    # ExceptionNotifier.notify_exception(error, env: request.env, data: { message: 'your error message' })
    render file: Rails.root.join('public/500.html'), layout: false, status: :internal_server_error
  end
end
