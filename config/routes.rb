Rails.application.routes.draw do

  get 'static_pages/home'
  get 'static_pages/help'


  resources :sessions, only: [:create, :destroy]
  resources :user_events
  resources :events do
    resources :photos, shallow: true
  end

  resources :users
    root 'home#index'

    get 'auth/facebook', as: "login"
    get 'auth/facebook/callback', to: 'sessions#create'
    get 'logout' => 'sessions#destroy', as: "logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
