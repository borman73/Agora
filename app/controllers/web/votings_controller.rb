class Web::VotingsController < Web::ApplicationController
  before_action :set_voting, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: :update

  def index
    @votings = Voting.all
  end

  def show; end

  def edit; end

  def create
    @group = Group.find(params[:group_id])
    @voting = @group.votings.create(voting_params)

    if @voting.save!
      flash[:notice] = "#{@voting.type} was successfully created."
      redirect_to(group_voting_path(id: @voting.id))
    else
      render(:new)
    end
  end

  def update
    if @voting.update(voting_params)
      flash[:notice] = "#{@voting.type} was successfully updated."
      redirect_to(group_voting_path(@voting))
    else
      render(:edit)
    end
  end

  def destroy
    @group = Group.find(@voting.group_id)
    @voting.destroy
    flash[:notice] = "#{@voting.type} was successfully deleted."
    redirect_to(group_path(@group.id))
  end

  private

  def set_voting
    @voting = Voting.find(params[:id])
  end

  def voting_params
    params.require(:voting).permit(:name, :question, :type, :active, :start_date, :stop_date, :quorum, :author_id)
  end
end
