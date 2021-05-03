Rails.application.routes.draw do
  resources :users
  resources :solutions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products
  resources :solutions

end
