Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  post 'auth/login', to: 'users#login'
  get 'auth/auto_login', to: 'users#auto_login'
  get 'users', to: 'users#index' 
  get '/users/:id', to: 'users#show'

  #catch errors
  get '*unmatched_route', to: 'application#not_found'
end
