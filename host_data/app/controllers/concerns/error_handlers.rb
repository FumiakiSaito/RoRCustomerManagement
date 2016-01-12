module ErrorHandlers

  # includedブロック内のコードが評価されるようにする為に定義
  extend ActiveSupport::Concern

  included do
    # コントローラ内で例外が発生した時に処理するメソッドを指定
    rescue_from Exception, with: :rescue500
    rescue_from ActionController::ParameterMissing, with: :rescue400
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ApplicationController::IpAddressRejected, with: :rescue403
    rescue_from ActionController::RoutingError, with: :rescue404 # ルーティングエラー
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404   # DBレコードNotFound
  end

  # コントローラ内で例外が発生した時の処理
  private
  def rescue400(e)
    @exception = e
    render 'errors/bad_request', status: 400
  end

  def rescue403(e)
    @exception = e
    render 'errors/forbidden', status: 403
  end

  def rescue404(e)
    @exception = e
    render 'errors/not_found', status: 404
  end

  def rescue500(e)
    @exception = e
    render 'errors/internal_server_error', status: 500
  end
end
