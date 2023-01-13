class Web::BallotsController < Web::VotingsController
  def new
    @ballot = Ballot.new
  end
end
