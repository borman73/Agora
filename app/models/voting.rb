class Voting < ApplicationRecord

  validates :name, presence: true

  belongs_to :usergroup
  has_many :users through: :usergroups
  belongs_to :group through: :usergroups

end
