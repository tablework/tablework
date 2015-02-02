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

    resources :space_memberships do
      collection do
        get '/confirm/:token', to: 'space_memberships#confirm', as: 'confirm_invite'
      end
    end
  end

  resources :scenes do
    member do
      get :assign_cast
    end
    resources :notes
  end

  resources :scene_memberships, only: [:create, :destroy]

  delete 'remove_note/:id', to: 'characters#remove_note', as: :remove_note

  root 'application#index'

end
