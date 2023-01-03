class Voting < ApplicationRecord
  validates :name, :description, :author_id, presence: true

  belongs_to :group, class_name: 'Group'
  belongs_to :author, class_name: 'User'
  has_many :users, through: :group, class_name: 'User'
end
