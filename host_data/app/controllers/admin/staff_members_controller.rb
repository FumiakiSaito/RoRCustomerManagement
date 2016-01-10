class Admin::StaffMembersController < Admin::Base
  def index
    # 姓、名の順に全レコード取得
    @staff_members = StaffMember.order(:family_name_kana, :given_name_kana)
  end
end
