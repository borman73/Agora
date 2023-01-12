FactoryBot.define do
  factory :option do
    value
    voting_id
    voting factory: :voting
  end
end
