Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
  resources :users
  resources :families
  resources :families, only: [:show] do
    resources :roles, only: [:new, :create, :destroy]
  end
  resources :tags, only: [:create]
  resources :families, only: [:show] do 
    resources :boards, only: [:edit]
    resources :users, only: [:show]
  end
  resources :boards, only: [:update]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  get '/auth/github/callback' => 'sessions#create'
end
