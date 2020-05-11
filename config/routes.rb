Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  post 'auth/login', to: 'users#login'
  get 'auth/auto_login', to: 'users#auto_login'
  get 'users', to: 'users#index' 
  get 'users/:id', to: 'users#show'
  put 'users/:id', to: 'users#update'

  resources :articles, only: [:create]
  get 'articles', to: 'articles#index'
  get 'articles/topic/anxiety', to: 'articles#anxiety_articles'
  get 'articles/topic/depression', to: 'articles#depression_articles'
  get 'articles/topic/lifestyle', to: 'articles#lifestyle_articles'
  get 'articles/topic/pyschological_analysis', to: 'articles#pyschological_analysis_articles'
  put 'articles/:id', to: 'articles#update'
  delete 'articles/:id', to: 'articles#destroy'

  #catch errors
  get '*unmatched_route', to: 'application#not_found'
end
