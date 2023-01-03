class User < ApplicationRecord
  has_secure_password

  has_many :user_groups, class_name: 'UserGroup'
  has_many :groups, through: :user_groups, class_name: 'Group'
  has_many :votings, through: :user_groups, class_name: 'Voting'
  has_many :my_votings, class_name: 'Voting', foreign_key: :author_id

  validates :first_name, :last_name, :email, :role, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
                    uniqueness: true
end
