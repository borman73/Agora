class Web::BallotsController < Web::VotingsController
  def new
    @voting = Ballot.new
    2.times { @voting.options.build }
  end
end
