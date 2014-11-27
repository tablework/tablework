Rails.application.routes.draw do
  resources :characters, only: [:index, :new]

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'application#index'
end
