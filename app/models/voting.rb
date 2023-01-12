class Voting < ApplicationRecord
  validates :question, :author_id, presence: true

  belongs_to :group, class_name: 'Group'
  belongs_to :author, class_name: 'User'
  has_many :users, through: :group, class_name: 'User'
  has_many :options, class_name: 'Option', dependent: :destroy
  has_many :votes, through: :options, class_name: 'Vote'
end
