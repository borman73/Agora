class User < ApplicationRecord
  has_secure_password

  has_many :usergroups
  has_many :groups through: :usergroups
  has many :votings through: :usergroups

  validates :first_name, :last_name, :email, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
                    uniqueness: true
end
