Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, except: [:new, :create] do
    resources :products, except: [:edit, :update, :destroy, :put]
  end
  
  resources :products, except: :put do
    resources :solutions, only: [:new, :create, :show]
  end

  resources :solutions, only: [:new, :create, :index, :show]

  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get '/auth/facebook/callback', to: 'sessions#create_fb'

end
