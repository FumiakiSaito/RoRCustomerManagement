class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # レイアウトを決定するメソッドを指定
  layout :set_layout

  # コントローラ内で例外が発生した時に処理するメソッドを指定
  rescue_from Exception, with: :rescue500

  # URLのコントローラ名でレイアウトを決定する
  private
  def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      'customer'
    end
  end

  # コントローラ内で例外が発生した時の処理
  def rescue500(e)
    @exception = e
    render 'errors/internal_server_error', status: 500
  end
end
