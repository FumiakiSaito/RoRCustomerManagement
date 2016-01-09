class Staff::Base < ApplicationController
  # 現在ログインしているStaffMemberオブジェクトを返す
  private
  def current_staff_member
    if session[:staff_member_id]
      @current_staff_member ||= StaffMember.find_by(id: session[:staff_member_id])
    end
  end

  # current_staff_memberをヘルパーメソッドに登録
  # (app/helpers/application_helper.rbに定義するのと同じ効果、
  # つまりerbテンプレートで使う事ができるようになる
  helper_method :current_staff_member
end
