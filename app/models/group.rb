class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :user_groups, class_name: 'UserGroup', dependent: :destroy
  has_many :users, through: :user_groups, class_name: 'User'
  has_many :votings, class_name: 'Voting', dependent: :destroy
  has_many :ballots, class_name: 'Ballot', dependent: :destroy
  has_many :ratings, class_name: 'Rating', dependent: :destroy
  has_many :authors, through: :votings, class_name: 'User'

  validates :name, presence: true, uniqueness: true
end
