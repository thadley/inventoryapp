Rails.application.routes.draw do
  resources :properties
  resources :carts
  resources :inventories

  post '/carts', to: 'carts#checkout', as: :checkout
end
