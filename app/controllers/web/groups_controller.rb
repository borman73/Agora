class Web::GroupsController < Web::ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = current_user.owned_groups.build(group_params)
    if @group.save
      @user_group = UserGroup.create(user_id: current_user[:id], group_id: @group[:id], owner: true)
      redirect_to(group_path(@group[:id]))
    else
      render(:new)
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = 'Information was successfully updated'
      redirect_to(group_path(@group[:id]))
    else
      render(:edit)
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.owner == current_user
      @group.destroy
      flash[:notice] = "Group #{@group.name} has been deleted"
      redirect_to(root_path)
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
