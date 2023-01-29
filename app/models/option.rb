class Option < ApplicationRecord
  belongs_to :voting, class_name: 'Voting'
  has_many :votes, class_name: 'Vote', dependent: :destroy

  validates :value, presence: true

  def average_score
    (votes.reduce(0) { |total, vote| total + vote.score } / votes.count.to_f).floor(2)
  end
end
