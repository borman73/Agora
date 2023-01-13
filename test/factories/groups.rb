FactoryBot.define do
  factory :group do
    title
    description
    owner factory: :user
  end
end
