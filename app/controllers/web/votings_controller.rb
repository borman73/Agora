class Web::VotingsController < Web::ApplicationController
  before_action :set_voting, only: [:show, :edit, :update, :destroy]

  def index
    @votings = Voting.all
  end

  def show; end

  def edit; end

  def create
    @group = Group.find(params[:group_id])
    @voting = @group.votings.create(voting_params)

    if @voting.save!

      flash[:notice] = if @voting.type == 'Ballot'
                         'Ballot was successfully created.'
                       else
                         'Rating was successfully created.'
                       end

      redirect_to(group_voting_path(id: @voting.id))

    else
      render(:new)
    end
  end

  def update
    if @voting.update(voting_params)
      redirect_to(group_voting_path(@voting), notice: 'Voting was successfully updated.')
    else
      render(:edit)
    end
  end

  def destroy
    @voting.destroy
    redirect_to(group_votings_path, notice: 'Voting was successfully deleted.')
  end

  private

  def set_voting
    @voting = Voting.find(params[:id])
  end

  def voting_params
    params.require(:voting).permit(:name, :question, :type, :active, :start_date, :stop_date, :quorum, :author_id)
  end
end
