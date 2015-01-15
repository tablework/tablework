Rails.application.routes.draw do

  resources :characters do
    member do
      get :assign_space
      get :add_note
      post :create_note
    end
  end

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:edit, :update]
  resources :spaces

  delete 'remove_note/:id', to: 'characters#remove_note', as: :remove_note

  root 'application#index'

end
