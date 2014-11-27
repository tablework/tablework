Rails.application.routes.draw do
  get 'profiles/index'

  resources :characters do
    resources :notes, only: [:create, :destroy]  
    resources :scenes do
      resources :questions, only: [:create, :destroy]
    end
  end

  get "profile" => "profiles#index", as: :profile

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'application#index'
end
