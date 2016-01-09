class Admin::Base < ApplicationController
  # 現在ログインしているStaffMemberオブジェクトを返す
  private
  def current_administrator
    if session[:administrator_id]
      @current_administrator ||= Administrator.find_by(id: session[:administrator_id])
    end
  end

  # current_administratorをヘルパーメソッドに登録
  # (app/helpers/application_helper.rbに定義するのと同じ効果、
  # つまりerbテンプレートで使う事ができるようになる
  helper_method :current_administrator
end
