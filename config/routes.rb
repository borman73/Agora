Rails.application.routes.draw do
  
  root :to => "web/welcome#show"

  scope module: :web do
    # resource :welcome, only: :show
    resource :session, only: [:new, :create, :destroy]
  end

  namespace :admin do
    resources :users
  end

end
