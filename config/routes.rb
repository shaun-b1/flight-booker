Rails.application.routes.draw do
  resources :welcomes
  root 'flights#index'
  resources :flights
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
