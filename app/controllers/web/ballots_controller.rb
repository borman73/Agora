class Web::BallotsController < Web::VotingsController
  def new
    @ballot = Ballot.new
    2.times { @ballot.options.build }
  end
end
