Rails.application.routes.draw do
  # Root route (home page)
  root "dashboard#index"

  # RESTful routes for payments
  resources :payments, only: [:new, :create]

  # Dashboard route
  get 'dashboard/index'
end
