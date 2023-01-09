require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test 'create group' do
    group = create(:group)
    assert group.persisted?
  end
end
