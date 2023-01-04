require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCasegit
  test 'should get show' do
    get :show
    assert_response :success
  end
end
