class Web::RatingsController < Web::VotingsController
  def new
    @rating = Rating.new
    @rating.options.build
  end
end
