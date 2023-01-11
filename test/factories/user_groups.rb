FactoryBot.define do
  factory :user_group do
    user factory: :user
    group factory: :group
    owner factory: :user
  end
end
