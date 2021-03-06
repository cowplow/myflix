Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  get 'sign_in', to: 'sessions#new'
  resources :sessions, only: [:create]
  get '/sign_out', to: 'sessions#destroy'

  get '/register', to: 'users#new'

  #typically create a controller called pages, and action front
  root to: 'pages#front'

  get 'home', to: 'categories#index'

  resources :videos do
    get 'search', on: :collection
    resources :reviews, only: [:create]
  end

  resources :queue_items, only: [:create, :destroy]
  

  get 'my_queue', to: 'queue_items#index'
  post 'update_queue', to: 'queue_items#update_queue'
  
  resources :categories

  resources :users, only: [:show, :create, :edit, :update, :new]
end
