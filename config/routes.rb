Rails.application.routes.draw do
  resources :manufacturers, only: [:new, :create, :index]
  resources :phones, only: [:new, :create, :index]
end
