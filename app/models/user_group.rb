class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :votings, through: :group, class_name: 'Voting'

  validates :user_id, uniqueness: { scope: :group_id }
end
