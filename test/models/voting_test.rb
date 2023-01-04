require 'test_helper'

class VotingTest < ActiveSupport::TestCase
  test 'create' do
    voting = create(:voting)
    assert voting.persisted?
  end
end
