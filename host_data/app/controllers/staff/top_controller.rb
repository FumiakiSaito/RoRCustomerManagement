class Staff::TopController < Staff::Base

  skip_before_action :authorize

  def index
    # 任意的に例外を発生
    # raise
    render action: 'index'
  end
end
