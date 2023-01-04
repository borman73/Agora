FactoryBot.define do
  factory :voting do
    name
    description
    kind
    active
    start_date
    stop_date
    author { create(:user) }
    group { create(:group) }
    quorum
  end
end
