Rails.application.routes.draw do
  resources :balances, only:[:index, :show, :destroy]
  resources :transactions
  resources :transaction_codes
  resources :patients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "balances#index"
  get '/new_payment', :to => 'transactions#new_payment'


end
