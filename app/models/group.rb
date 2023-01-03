class Group < ApplicationRecord
  has_many :user_groups, class_name: 'UserGroup'
  has_many :users, through: :user_groups, class_name: 'User'
  has_many :votings, class_name: 'Voting'

  validates :name, presence: true
end
