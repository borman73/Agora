FactoryBot.define do
  factory :voting do
    name
    description
    kind
    active
    start_date
    stop_date
    author factory: :user
    group factory: :group
    quorum
  end
end
