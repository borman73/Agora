require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test 'create' do
    vote = create(:vote)
    assert vote.persisted?
  end
end
