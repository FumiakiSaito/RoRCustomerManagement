class Admin::TopController < Admin::Base
  def index
    # 意図的に例外を発生させる
    #raise IpAddressRejected
    render action: 'index'
  end
end
