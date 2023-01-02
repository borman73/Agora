class Group < ApplicationRecord

  has_many :usergroups
  has_many :users through: :usergroups
  has many :votings through: :usergroups
    
  validates :name, presence: true

end
