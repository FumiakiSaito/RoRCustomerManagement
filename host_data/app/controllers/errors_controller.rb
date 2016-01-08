class ErrorsController < ApplicationController
  def not_found
    # 例外を発生させる
    raise ActionController::RoutingError,
    "No route matches #{request.path.inspect}"
  end
end
