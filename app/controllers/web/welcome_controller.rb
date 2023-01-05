class Web::WelcomeController < Web::ApplicationController
  before_action :authenticate_user!

  def show; end
end
