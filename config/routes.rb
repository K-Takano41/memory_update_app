Rails.application.routes.draw do
  if Rails.env.development?
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  namespace :admin do
    get '/', to: 'dashboards#index'
    get 'login', to: "user_sessions#new"
    post 'login', to: "user_sessions#create"
    delete 'logout', to: "user_sessions#destroy"
    resources :prompts
    resources :users
    resources :memories, only: %i[index show destroy]
    resources :bad_events, only: %i[edit update]
    resources :good_events, only: %i[edit update]
  end

  root to: 'top#top'
  get 'auth/:provider/callback', to: 'twitter_sessions#create'
  get 'auth/failure', to: 'twitter_sessions#failure'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[new create] do
    post 'confirm', on: :collection
  end
  resources :password_resets, only: %i[new create edit update]
  resource :profiles, only: %i[show edit update]
  resources :bad_events, only: %i[new create edit update] do
    post 'confirm', on: :collection
  end
  get 'generate', to: 'images#generate'
  resources :memories, only: %i[show], shallow: true do
    get 'status_change', on: :member
    get 'check_image_status', on: :member
    get 'user_memories', on: :collection
    resources :good_events, only: %i[new create show edit update] do
      post 'confirm', on: :collection
    end
  end
end
