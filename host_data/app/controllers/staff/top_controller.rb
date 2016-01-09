class Staff::TopController < Staff::Base
  def index
    # 任意的に例外を発生
    # raise
    render action: 'index'
  end
end
