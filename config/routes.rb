Rails.application.routes.draw do

  resources :characters do
    member do
      get :assign_space
      get :add_note
      post :create_note
    end
    resources :scenes
    resources :notes
  end

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:edit, :update]
  resources :spaces do
    resources :scenes do
      resources :notes
    end
  end

  resources :scenes do
    resources :notes
  end
  delete 'remove_note/:id', to: 'characters#remove_note', as: :remove_note

  root 'application#index'

end
