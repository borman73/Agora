class User < ApplicationRecord
  has_secure_password

  has_many :user_groups, class_name: 'UserGroup', dependent: :destroy
  has_many :groups, through: :user_groups, class_name: 'Group'
  has_many :votings, through: :user_groups, class_name: 'Voting'
  has_many :my_votings, foreign_key: :author_id, class_name: 'Voting'

  validates :first_name, :last_name, :email, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
                    uniqueness: true

  has_many :owned_groups, foreign_key: 'owner_id', class_name: 'Group'
end
