Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  # get 'auth/:provider/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')
  # get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'auth/facebook', as: "login"
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout'   => 'sessions#destroy', as: "logout"


  resources :sessions, only: [:create, :destroy]	



  root 'home#index'

  resources :photos
  resources :user_events
  resources :events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
