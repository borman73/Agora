FactoryBot.define do
  factory :voting do
    name
    question
    active
    start_date
    stop_date
    author factory: :user
    group factory: :group
    type { '' }

    factory :ballot do
      type { 'Ballot' }
    end

    factory :rating do
      type { 'Rating' }
    end
  end
end
