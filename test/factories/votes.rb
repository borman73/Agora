FactoryBot.define do
  factory :vote do
    user factory: :user
    option factory: :option
    score
  end
end
