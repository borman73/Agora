class Voting < ApplicationRecord
  validates :title, :question, presence: true
  validates_associated :options

  belongs_to :group, class_name: 'Group'
  belongs_to :author, class_name: 'User'
  has_many :users, through: :group, class_name: 'User'
  has_many :options, class_name: 'Option', dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true, reject_if: :all_blank
  has_many :votes, through: :options, class_name: 'Vote'

  scope :ballots, -> { where(type: 'Ballot') }
  scope :ratings, -> { where(type: 'Rating') }
end
