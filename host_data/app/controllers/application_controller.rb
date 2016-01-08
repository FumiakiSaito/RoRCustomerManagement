class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # レイアウトを決定するメソッドを指定
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  # ErrorHandlers(concerns/error_handlers.rb)読み込み
  #include ErrorHandlers if Rails.env.production? # 本番のみエラー画面を有効にする
  include ErrorHandlers

  # URLのコントローラ名でレイアウトを決定する
  private
  def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      'customer'
    end
  end
end
