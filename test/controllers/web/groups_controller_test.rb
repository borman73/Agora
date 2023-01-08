require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    user = create(:user)
    sign_in user
  end

  test 'should get new group' do
    get :new
    assert_response :success
  end
end
