FactoryBot.define do
  factory :group do
    name
    description
    owner factory: :user
  end
end
