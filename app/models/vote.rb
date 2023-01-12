class Vote < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :option, class_name: 'Option'

  validates :user_id, uniqueness: { scope: :option_id }
end
