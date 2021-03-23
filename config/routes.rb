Rails.application.routes.draw do
  resources :users, only: %i[show]
  resources :categories, only: %i[index new create show]
  resources :articles, only: %i[index new create show] do
    resources :votes, only: %i[new create destroy]
  end

  root 'articles#index'

  #Register
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # Sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
