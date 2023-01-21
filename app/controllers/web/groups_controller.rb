class Web::GroupsController < Web::ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:edit, :update, :destroy]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.includes(:votings).find(params[:id])
  end

  def edit; end

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
    if @group.update(group_params)
      flash[:notice] = 'Information was successfully updated'
      redirect_to(group_path(@group[:id]))
    else
      render(:edit)
    end
  end

  def destroy
    if @group.owner == current_user
      @group.destroy
      flash[:notice] = "Group #{@group.title} has been deleted"
      redirect_to(root_path)
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
