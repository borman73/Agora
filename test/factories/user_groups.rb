FactoryBot.define do
  factory :user_group do
    user { create(:user) }
    group { create(:group) }
    role
  end
end
