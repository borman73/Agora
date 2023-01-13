require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  test 'create' do
    rating = create(:rating)
    assert rating.persisted?
  end
end
