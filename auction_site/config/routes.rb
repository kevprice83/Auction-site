Rails.application.routes.draw do
  root to: 'users#home'

  resources :users do
    resources :products
  end
end
