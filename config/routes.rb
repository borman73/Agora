Rails.application.routes.draw do
  
  root :to => "web/welcome#show"

  scope module: :web do
    resource :session, only: [:new, :create, :destroy]
      get 'sign_in', to: 'sessions#new', as: 'sign_in'
      
    resources :users
      get 'sign_up', to: 'users#new', as: 'sign_up'
      get 'my_profile', to: 'users#show', as: 'my_profile'
      get 'edit_profile', to: 'users#edit', as: 'edit_profile'
  end

  namespace :admin do
    resources :users
    resources :groups
  end

end
