Rails.application.routes.draw do

  root to: 'static_pages#index'

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

  #testing to be removed later
  get 'payments', to: 'payments#show'
  get 'subscription', to: 'payments#subscription'
  post 'payments/brainsub', to: 'payments#brainsub'
  # post 'payments/subscription', to: 'payments#brainsub' do
  #   result = Braintree::Customer.create(
  #     :first_name => params[:first_name],
  #     :last_name => params[:last_name],
  #     :payment_method_nonce => params[:payment_method_nonce]
  #   )
  #   if result.success?
  #     "Customer created with name: #{result.customer.first_name} #{result.customer.last_name}" +
  #     "<a href=\"/subscriptions?id=#{result.customer.id}\">Click here to sign this Customer up for a recurring payment</a>"
  #   else
  #     "Error: #{result.message}"
  #   end
  # end
  post 'payments/process', to: 'payments#brainprocess'
  post 'payments/cancel', to: 'payments#braincancel'
  #end testing
  get 'dashboard', to: 'application#index'
  get 'about', to: 'static_pages#about'
  get 'pricing', to: 'static_pages#pricing'
end
