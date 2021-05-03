Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, except: [:new, :create] do
    resources :products
  end
  
  resources :products do
    resources :solutions
  end

  resources :products
  resources :solutions

  get '/', to: 'welcome#home'
  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get "/auth/github/callback", to: "sessions#create_github"

end
