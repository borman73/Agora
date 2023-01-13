class Option < ApplicationRecord
  belongs_to :voting, class_name: 'Voting'
  has_many :votes, class_name: 'Vote', dependent: :destroy

  validates :value, presence: true, uniqueness: true
end
