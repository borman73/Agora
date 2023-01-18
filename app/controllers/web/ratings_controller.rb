class Web::RatingsController < Web::VotingsController
  def new
    @voting = Rating.new
    @voting.options.build
  end
end
