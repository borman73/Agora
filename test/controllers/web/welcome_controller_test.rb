require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase
  setup do
    user = create(:user)
    sign_in user
  end

  test 'should get show' do
    get :show
    assert_response :success
  end
end
