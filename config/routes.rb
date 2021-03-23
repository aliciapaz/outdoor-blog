Rails.application.routes.draw do
  resources :users, only: %i[new create show]
  resources :categories, only: %i[index new create show]
  resources :articles, only: %i[index new create show] do
    resources :votes, only: %i[new create destroy]
  end

  root 'articles#index'

  # logout
  get    '/login',   to: 'users#new'
  post   '/login',   to: 'users#create'
  post '/logout',  to: 'users#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
