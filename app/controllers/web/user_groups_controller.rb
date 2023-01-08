class Web::UserGroupsController < Web::ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    @group = Group.find(params[:group_id])
    @user_group = current_user.user_groups.build(group_id: @group[:id], owner: false)
    if @user_group.save
      flash[:notice] = "You've joined the group #{@group.name}"
    end
    redirect_to(group_path(@group))
  end

  def destroy
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.find_by(group_id: @group.id, user_id: current_user.id)
    @user_group.destroy

    if @user_group.destroy
      flash[:alert] = "You've left the group #{@group.name}"
      redirect_to(group_path(@group))
    end
  end

  private

  def user_group_params
    params.require(:user_group).permit(:user_id, :group_id, :owner)
  end
end
