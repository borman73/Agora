FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :name, :value] do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :boolean, aliases: [:active] do
    true || false
  end

  sequence :text, aliases: [:description, :question] do |n|
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. #{n}"
  end

  sequence :date, aliases: [:start_date, :stop_date] do |n|
    (Time.now + n.day).to_date
  end

  sequence :integer, aliases: [:group_id, :author_id, :voting_id, :score] do |n|
    1 + n
  end

  sequence :avatar do
    'anon.png' || nil
  end
end
