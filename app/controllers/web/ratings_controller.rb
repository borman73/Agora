class Web::RatingsController < Web::VotingsController
  def new
    @rating = Rating.new
  end
end
