class UserGroup < ApplicationRecord

  belongs_to :user
  belongs_to :group
  has_many :votings 
   
end
