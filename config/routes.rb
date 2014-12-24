Rails.application.routes.draw do
  root 'pages#front'

  get 'ui/(:action)', controller: 'ui'
  get 'home', to: 'events#index'
  get 'sign_in', to: 'sessions#new'
  get 'sign_up', to: 'users#new'
  resources :events, only: [:index, :show]
  resources :users, only: [:create]
  resources :sessions, only: [:create]
end
