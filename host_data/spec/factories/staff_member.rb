# Factory Girlツールを使用
FactoryGirl.define do
  factory :staff_member do
    sequence(:email) { |n| "member#{n}@example.com"} # member0@example.com, member1@example.comとなっていく
    family_name '山田'
    given_name '太郎'
    family_name_kana 'ヤマダ'
    given_name_kana 'タロウ'
    password 'pw'
    start_date { Date.yesterday }
    end_date nil
    suspended false
  end
end
