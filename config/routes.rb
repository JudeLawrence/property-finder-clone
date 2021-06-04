Rails.application.routes.draw do
  get 'users/:id/show', to: 'users#show', as: 'user_profile'
  devise_for :users
  root to: 'pages#home'
  resources :property_listings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
