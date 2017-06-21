Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :photos
  resources :user_events
  resources :events

  resources :users
    # root "photos#index"
    root 'home#index'
      get 'photos/index' => 'photos#index'
      get 'photos/new'
      get 'photos/create'
      get 'photos/destroy'
      # get 'auth/:provider/callback', to: 'sessions#create'
      # get 'auth/failure', to: redirect('/')
      # get 'signout', to: 'sessions#destroy', as: 'signout'
      get 'auth/facebook', as: "login"
      get 'auth/facebook/callback', to: 'sessions#create'
      get 'logout' => 'sessions#destroy', as: "logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
