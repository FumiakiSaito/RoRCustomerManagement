class Admin::TopController < Admin::Base
  def index
    if current_administrator
      render action: 'dashboard'
    else
      # 意図的に例外を発生させる
      #raise IpAddressRejected
      render action: 'index'
    end
  end
end
