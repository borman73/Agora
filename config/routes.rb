Rails.application.routes.draw do
  
  root :to => "web/welcome#show"

  scope module: :web do
    resource :session, only: [:new, :create, :destroy]
      get 'sign_in', to: 'sessions#new', as: 'sign_in'
      delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

      
    resources :users
      get 'sign_up', to: 'users#new', as: 'sign_up'
      get 'my_profile', to: 'users#show', as: 'my_profile'
      get 'edit_profile', to: 'users#edit', as: 'edit_profile'

    resources :groups do
      resource :user_group, only: [:create, :destroy]
        post 'join_group', to: 'user_groups#create', as: 'join_group'
        delete 'leave_group', to: 'user_groups#destroy', as: 'leave_group'
    end
  end
  
  namespace :admin do
    resources :users
    resources :groups
  end
  
end
