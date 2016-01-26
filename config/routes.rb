# == Route Map
#
#                                 Prefix Verb     URI Pattern                                                  Controller#Action
#                                   root GET      /                                                            static_pages#index
#                 assign_space_character GET      /characters/:id/assign_space(.:format)                       characters#assign_space
#                     add_note_character GET      /characters/:id/add_note(.:format)                           characters#add_note
#                  create_note_character POST     /characters/:id/create_note(.:format)                        characters#create_note
#                       character_scenes GET      /characters/:character_id/scenes(.:format)                   scenes#index
#                                        POST     /characters/:character_id/scenes(.:format)                   scenes#create
#                    new_character_scene GET      /characters/:character_id/scenes/new(.:format)               scenes#new
#                   edit_character_scene GET      /characters/:character_id/scenes/:id/edit(.:format)          scenes#edit
#                        character_scene GET      /characters/:character_id/scenes/:id(.:format)               scenes#show
#                                        PATCH    /characters/:character_id/scenes/:id(.:format)               scenes#update
#                                        PUT      /characters/:character_id/scenes/:id(.:format)               scenes#update
#                                        DELETE   /characters/:character_id/scenes/:id(.:format)               scenes#destroy
#                        character_notes GET      /characters/:character_id/notes(.:format)                    notes#index
#                                        POST     /characters/:character_id/notes(.:format)                    notes#create
#                     new_character_note GET      /characters/:character_id/notes/new(.:format)                notes#new
#                    edit_character_note GET      /characters/:character_id/notes/:id/edit(.:format)           notes#edit
#                         character_note GET      /characters/:character_id/notes/:id(.:format)                notes#show
#                                        PATCH    /characters/:character_id/notes/:id(.:format)                notes#update
#                                        PUT      /characters/:character_id/notes/:id(.:format)                notes#update
#                                        DELETE   /characters/:character_id/notes/:id(.:format)                notes#destroy
#                             characters GET      /characters(.:format)                                        characters#index
#                                        POST     /characters(.:format)                                        characters#create
#                          new_character GET      /characters/new(.:format)                                    characters#new
#                         edit_character GET      /characters/:id/edit(.:format)                               characters#edit
#                              character GET      /characters/:id(.:format)                                    characters#show
#                                        PATCH    /characters/:id(.:format)                                    characters#update
#                                        PUT      /characters/:id(.:format)                                    characters#update
#                                        DELETE   /characters/:id(.:format)                                    characters#destroy
#                       new_user_session GET      /users/sign_in(.:format)                                     devise/sessions#new
#                           user_session POST     /users/sign_in(.:format)                                     devise/sessions#create
#                   destroy_user_session DELETE   /users/sign_out(.:format)                                    devise/sessions#destroy
#                user_omniauth_authorize GET|POST /users/auth/:provider(.:format)                              users/omniauth_callbacks#passthru {:provider=>/facebook/}
#                 user_omniauth_callback GET|POST /users/auth/:action/callback(.:format)                       users/omniauth_callbacks#:action
#                          user_password POST     /users/password(.:format)                                    devise/passwords#create
#                      new_user_password GET      /users/password/new(.:format)                                devise/passwords#new
#                     edit_user_password GET      /users/password/edit(.:format)                               devise/passwords#edit
#                                        PATCH    /users/password(.:format)                                    devise/passwords#update
#                                        PUT      /users/password(.:format)                                    devise/passwords#update
#               cancel_user_registration GET      /users/cancel(.:format)                                      devise/registrations#cancel
#                      user_registration POST     /users(.:format)                                             devise/registrations#create
#                  new_user_registration GET      /users/sign_up(.:format)                                     devise/registrations#new
#                 edit_user_registration GET      /users/edit(.:format)                                        devise/registrations#edit
#                                        PATCH    /users(.:format)                                             devise/registrations#update
#                                        PUT      /users(.:format)                                             devise/registrations#update
#                                        DELETE   /users(.:format)                                             devise/registrations#destroy
#                              edit_user GET      /users/:id/edit(.:format)                                    users#edit
#                                   user PATCH    /users/:id(.:format)                                         users#update
#                                        PUT      /users/:id(.:format)                                         users#update
#                         space_messages GET      /spaces/:space_id/messages(.:format)                         messages#index
#                                        POST     /spaces/:space_id/messages(.:format)                         messages#create
#                      new_space_message GET      /spaces/:space_id/messages/new(.:format)                     messages#new
#                     edit_space_message GET      /spaces/:space_id/messages/:id/edit(.:format)                messages#edit
#                          space_message GET      /spaces/:space_id/messages/:id(.:format)                     messages#show
#                                        PATCH    /spaces/:space_id/messages/:id(.:format)                     messages#update
#                                        PUT      /spaces/:space_id/messages/:id(.:format)                     messages#update
#                                        DELETE   /spaces/:space_id/messages/:id(.:format)                     messages#destroy
#                      space_scene_notes GET      /spaces/:space_id/scenes/:scene_id/notes(.:format)           notes#index
#                                        POST     /spaces/:space_id/scenes/:scene_id/notes(.:format)           notes#create
#                   new_space_scene_note GET      /spaces/:space_id/scenes/:scene_id/notes/new(.:format)       notes#new
#                  edit_space_scene_note GET      /spaces/:space_id/scenes/:scene_id/notes/:id/edit(.:format)  notes#edit
#                       space_scene_note GET      /spaces/:space_id/scenes/:scene_id/notes/:id(.:format)       notes#show
#                                        PATCH    /spaces/:space_id/scenes/:scene_id/notes/:id(.:format)       notes#update
#                                        PUT      /spaces/:space_id/scenes/:scene_id/notes/:id(.:format)       notes#update
#                                        DELETE   /spaces/:space_id/scenes/:scene_id/notes/:id(.:format)       notes#destroy
#                           space_scenes GET      /spaces/:space_id/scenes(.:format)                           scenes#index
#                                        POST     /spaces/:space_id/scenes(.:format)                           scenes#create
#                        new_space_scene GET      /spaces/:space_id/scenes/new(.:format)                       scenes#new
#                       edit_space_scene GET      /spaces/:space_id/scenes/:id/edit(.:format)                  scenes#edit
#                            space_scene GET      /spaces/:space_id/scenes/:id(.:format)                       scenes#show
#                                        PATCH    /spaces/:space_id/scenes/:id(.:format)                       scenes#update
#                                        PUT      /spaces/:space_id/scenes/:id(.:format)                       scenes#update
#                                        DELETE   /spaces/:space_id/scenes/:id(.:format)                       scenes#destroy
# confirm_invite_space_space_memberships GET      /spaces/:space_id/space_memberships/confirm/:token(.:format) space_memberships#confirm
#                space_space_memberships GET      /spaces/:space_id/space_memberships(.:format)                space_memberships#index
#                                        POST     /spaces/:space_id/space_memberships(.:format)                space_memberships#create
#             new_space_space_membership GET      /spaces/:space_id/space_memberships/new(.:format)            space_memberships#new
#            edit_space_space_membership GET      /spaces/:space_id/space_memberships/:id/edit(.:format)       space_memberships#edit
#                 space_space_membership GET      /spaces/:space_id/space_memberships/:id(.:format)            space_memberships#show
#                                        PATCH    /spaces/:space_id/space_memberships/:id(.:format)            space_memberships#update
#                                        PUT      /spaces/:space_id/space_memberships/:id(.:format)            space_memberships#update
#                                        DELETE   /spaces/:space_id/space_memberships/:id(.:format)            space_memberships#destroy
#                                 spaces GET      /spaces(.:format)                                            spaces#index
#                                        POST     /spaces(.:format)                                            spaces#create
#                              new_space GET      /spaces/new(.:format)                                        spaces#new
#                             edit_space GET      /spaces/:id/edit(.:format)                                   spaces#edit
#                                  space GET      /spaces/:id(.:format)                                        spaces#show
#                                        PATCH    /spaces/:id(.:format)                                        spaces#update
#                                        PUT      /spaces/:id(.:format)                                        spaces#update
#                                        DELETE   /spaces/:id(.:format)                                        spaces#destroy
#                      assign_cast_scene GET      /scenes/:id/assign_cast(.:format)                            scenes#assign_cast
#                         view_all_scene GET      /scenes/:id/view_all(.:format)                               scenes#view_all
#                            scene_notes GET      /scenes/:scene_id/notes(.:format)                            notes#index
#                                        POST     /scenes/:scene_id/notes(.:format)                            notes#create
#                         new_scene_note GET      /scenes/:scene_id/notes/new(.:format)                        notes#new
#                        edit_scene_note GET      /scenes/:scene_id/notes/:id/edit(.:format)                   notes#edit
#                             scene_note GET      /scenes/:scene_id/notes/:id(.:format)                        notes#show
#                                        PATCH    /scenes/:scene_id/notes/:id(.:format)                        notes#update
#                                        PUT      /scenes/:scene_id/notes/:id(.:format)                        notes#update
#                                        DELETE   /scenes/:scene_id/notes/:id(.:format)                        notes#destroy
#                                 scenes GET      /scenes(.:format)                                            scenes#index
#                                        POST     /scenes(.:format)                                            scenes#create
#                              new_scene GET      /scenes/new(.:format)                                        scenes#new
#                             edit_scene GET      /scenes/:id/edit(.:format)                                   scenes#edit
#                                  scene GET      /scenes/:id(.:format)                                        scenes#show
#                                        PATCH    /scenes/:id(.:format)                                        scenes#update
#                                        PUT      /scenes/:id(.:format)                                        scenes#update
#                                        DELETE   /scenes/:id(.:format)                                        scenes#destroy
#                      scene_memberships POST     /scene_memberships(.:format)                                 scene_memberships#create
#                       scene_membership DELETE   /scene_memberships/:id(.:format)                             scene_memberships#destroy
#                          user_payments GET      /user_payments(.:format)                                     user_payments#index
#                                        POST     /user_payments(.:format)                                     user_payments#create
#                       new_user_payment GET      /user_payments/new(.:format)                                 user_payments#new
#                      edit_user_payment GET      /user_payments/:id/edit(.:format)                            user_payments#edit
#                           user_payment GET      /user_payments/:id(.:format)                                 user_payments#show
#                                        PATCH    /user_payments/:id(.:format)                                 user_payments#update
#                                        PUT      /user_payments/:id(.:format)                                 user_payments#update
#                                        DELETE   /user_payments/:id(.:format)                                 user_payments#destroy
#                            remove_note DELETE   /remove_note/:id(.:format)                                   characters#remove_note
#                               payments GET      /payments(.:format)                                          payments#show
#                           subscription GET      /subscription(.:format)                                      payments#subscription
#                      payments_thankyou GET      /payments/thankyou(.:format)                                 payments#thankyou
#                       payments_process POST     /payments/process(.:format)                                  payments#brainprocess
#                        payments_cancel POST     /payments/cancel/:id(.:format)                               payments#braincancel
#                              dashboard GET      /dashboard(.:format)                                         application#index
#                                  about GET      /about(.:format)                                             static_pages#about
#                                pricing GET      /pricing(.:format)                                           static_pages#pricing
#                                    erd          /erd                                                         Erd::Engine
#
# Routes for Erd::Engine:
#         GET  /                  erd/erd#index
#         PUT  /                  erd/erd#update
# migrate PUT  /migrate(.:format) erd/erd#migrate
#    root GET  /                  erd/erd#index
#

Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'static_pages#index'

  get 'unread_count/:id', to: 'users#unread', as: 'unread_count'

  resources :characters do
    member do
      get :assign_space
      get :add_note
      post :create_note
      get :summary
      get :share_form
      post :share
    end
    resources :scenes
    resources :notes
  end

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do
    collection do
      put :toggle_intro_1
      put :toggle_intro_2
      put :toggle_intro_3
    end
  end
  resources :spaces do
    resources :messages
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
      get :view_all
    end
    resources :notes
  end

  resources :scene_memberships, only: [:create, :destroy]
  resources :user_payments
  delete 'remove_note/:id', to: 'characters#remove_note', as: :remove_note

  resources :sm_invitation_notifications, only: :show

  #testing to be removed later
  get 'payments', to: 'payments#show'
  get 'subscription', to: 'payments#subscription'
  get 'payments/thankyou', to: 'payments#thankyou'
  post 'payments/process', to: 'payments#brainprocess'
  post 'payments/cancel/:id', to: 'payments#braincancel', as: 'payments_cancel'
  #end testing
  get 'dashboard', to: 'application#index'
  get 'about', to: 'static_pages#about'
  get 'pricing', to: 'static_pages#pricing'
  delete 'space_remove/:space_id/:character_id/', to: 'spaces#remove'
  post 'promotion', to: 'payments#promotion'
end
