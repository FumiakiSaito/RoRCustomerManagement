class Customer::TopController < ApplicationController
  def index
    # 意図的に例外を発生させる
    # raise Forbidden
    raise ActiveRecord::RecordNotFound
    render action: 'index'
  end
end
