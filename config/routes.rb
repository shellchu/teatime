Rails.application.routes.draw do
  get 'ui/(:action)', controller: 'ui'
  get 'home', to: 'events#index'

  resources :events, only: [:index, :show]
end
