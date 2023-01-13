require 'test_helper'

class BallotTest < ActiveSupport::TestCase
  test 'create' do
    ballot = create(:ballot)
    assert ballot.persisted?
  end
end
