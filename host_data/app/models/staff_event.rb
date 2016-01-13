class StaffEvent < ActiveRecord::Base

  # typeからむはRoRとして特別な意味があるので、普通のカラムとして使用できるようにする
  self.inheritance_column = nil

  belongs_to :member, class_name: 'StaffMember', foreign_key: 'staff_member_id'
  alias_attribute :occurred_at, :created_at

  DESCRIPTIONS = {
    logged_in: 'ログイン',
    logged_out: 'ログアウト',
    rejected: 'ログイン拒否'
  }

  def description
    DESCRIPTIONS[type.to_sym]
  end
end
