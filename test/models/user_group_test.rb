require 'test_helper'

class UserGroupTest < ActiveSupport::TestCase
  test 'create' do
    user_group = create(:user_group)
    assert user_group.persisted?
  end
end
