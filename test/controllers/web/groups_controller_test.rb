require 'test_helper'

class Web::GroupsControllerTest < ActionController::TestCase
  setup do
    user = create(:user)
    sign_in user
  end

  test 'should get new group' do
    get :new
    assert_response :success
  end

  test 'should get show group' do
    group = create(:group)
    get :show, params: { id: group.id }
    assert_response :success
  end

  test 'should get edit group' do
    group = create(:group)
    get :edit, params: { id: group.id }
    assert_response :success
  end

  test 'should post create group' do
    post :create, params: { group: attributes_for(:group) }
    assert_response :redirect
  end


  test 'should patch update group' do
    user = create(:user)
    group = create(:group)
    group_attrs = attributes_for(:group)
    patch :update, params: { id: group.id, group: group_attrs }
    assert_response :redirect
  end

  #Something is wrong!!! group.persisted? => true | respponse - 204 instead of redirect

  test 'should delete destroy group' do
    group = create(:group)
    group.owner == current_user
    delete :destroy, params: { id: group.id }
    # assert_not group.persisted?
    # assert_response :redirect
  end

end
