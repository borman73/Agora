FactoryBot.define do
  factory :voting do
    name { 'MyString' }
    description { 'MyText' }
    type { '' }
    active { false }
    start_date { '2023-01-02' }
    stop_date { '2023-01-02' }
    quorum { 1 }
  end
end
