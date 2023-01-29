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
    @voting = Voting.find(params[:id])
    @group = Group.find(@voting.group_id)
    @voting.destroy
    flash[:notice] = "#{@voting.type} was successfully deleted."
    redirect_to(group_path(@group.id))
  end

  def vote
    @voting = Voting.includes(:options).find_by_id(params[:voting_id])
    vote = current_user.votes.create({ option_id: params[:option][:id] })
    if vote.save!
      flash[:notice] = 'Your vote was successfully recorded.'
      redirect_to(group_voting_path(id: @voting.id))
    else
      flash[:error] = 'Something went wrong.'
      render(:show)
    end
  end

  def rate
    @voting = Voting.includes(:options).find_by_id(params[:voting_id])
    params['value'][0].values[0].each do |key, value|
      current_user.votes.create({ option_id: key, score: value })
    end
    flash[:notice] = 'Your rating was successfully recorded.'
    redirect_to(group_voting_path(id: @voting.id))
  end

  def display_results
    @voting = Voting.find_by_id(params[:voting_id])
    if @voting.type == "Rating"
      @chart_data = {}
      @voting.options.map do |option|
        @chart_data[option.value] = option.average_score
      end
    end  
    render(turbo_stream: turbo_stream.replace('display', partial: 'hide', locals: { chart_data: @chart_data }))
  end

  def hide_results
    @voting = Voting.includes(:options).find_by_id(params[:voting_id])
    render(turbo_stream: turbo_stream.replace('hide', partial: 'display'))
  end

  private

  def set_voting
    @voting = Voting.includes(:options).find(params[:id])
  end

  def voting_params
    params.require(:voting).permit(
      :title, :question, :type, :active, :start_date, :stop_date, :author_id,
      options_attributes: [:id, :value, :_destroy]
    )
  end
end
