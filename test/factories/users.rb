FactoryBot.define do
  factory :user, aliases: [:author, :owner] do
    first_name
    last_name
    password
    email
    avatar

    factory :admin do
      type { 'Admin' }
    end
  end
end
