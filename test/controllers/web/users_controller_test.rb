require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    user = create(:user)
    sign_in user
  end

  test 'should get new user' do
    get :new
    assert_response :success
  end

  test 'should post create user' do
    post :create, params: { user: attributes_for(:user) }
    assert_response :redirect
  end

  test 'should get show user' do
    user = create(:user)
    get :show, params: { id: user.id }
    assert_response :success
  end

  test 'should get edit user' do
    user = create(:user)
    get :edit, params: { id: user.id }
    assert_response :success
  end

  test 'should patch update user' do
    user = create(:user)
    user_attrs = attributes_for(:user)
    patch :update, params: { id: user.id, user: user_attrs }
    assert_response :redirect
  end

  test 'should delete destroy user' do
    user = create(:user)
    delete :destroy, params: { id: user.id }
    assert_response :redirect
  end
end
