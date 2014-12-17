Rails.application.routes.draw do

  resources :characters do
    resources :notes, only: [:create, :destroy]
    resources :scenes do
      resources :questions, only: [:create, :destroy]
    end
  end

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:edit, :update]

  root 'application#index'

end
