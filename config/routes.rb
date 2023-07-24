Rails.application.routes.draw do
  get 'good_events/new'
  get 'good_events/create'
  get 'good_events/show'
  get 'good_events/edit'
  get 'good_events/update'
  get 'good_events/destroy'
  namespace :admin do
    resources :prompts
  end
  if Rails.env.development?
    require "sidekiq/web"
    mount Sidekiq::Web => "/sidekiq"
  end
  root to: 'top#top'
  get 'auth/:provider/callback', to: 'twitter_sessions#create'
  get 'auth/failure', to: 'twitter_sessions#failure'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[new create show]
  resources :bad_events, only: %i[new create show] do
    member do
      get 'image', to: 'memories#image'
    end
  end
end
