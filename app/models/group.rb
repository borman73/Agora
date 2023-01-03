class Group < ApplicationRecord
  has_many :user_groups, class_name: 'UserGroup'
  has_many :users, through: :user_groups, class_name: 'User'
  has_many :votings, class_name: 'Voting'
  has_many :authors, through: :votings, class_name: 'User'

  validates :name, presence: true
end
