class Customer::TopController < ApplicationController
  def index
    # 意図的に例外を発生させる
    # raise Forbidden
    render action: 'index'
  end
end
