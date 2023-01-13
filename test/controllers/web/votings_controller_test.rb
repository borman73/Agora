# require "test_helper"

# class Web::VotingsControllerTest < ActionController::TestCase
#   setup do
#     group = create(:group)
#     voting = create(:voting)
#   end

#   test "should get index voting" do
#     get group_votings_path
#     assert_response :success
#   end

#   test "should get new voting" do
#     get :new
#     assert_response :success
#   end

#   test "should create voting" do
#     post :create, params: { voting: attributes_for(:voting) }
#     assert_response :redirect
#   end

#   test "should show voting" do
#     get :show, params: { id: voting.id }
#     assert_response :success
#   end

#   test "should get edit voting" do
#     get :edit, params: { id: voting.id }
#     assert_response :success
#   end

#   test "should update voting" do
#     patch :update, params: { id: voting.id, voting: attributes_for(:voting) }
#     assert_response :redirect
#   end

#   test "should destroy voting" do
#     assert_difference("Voting.count", -1) do
#       delete group_voting_path(@voting)
#   end

#   assert_response :redirect
#   end
# end
