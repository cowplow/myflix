Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root to: 'fronts#front'

  resources :videos do
    get 'search', on: :collection
  end

  resources :categories

  resources :users, only: [:show, :create, :edit, :update, :new]
end
