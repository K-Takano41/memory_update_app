Rails.application.routes.draw do
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
  resources :users, only: %i[new create ]
  resources :bad_events, only: %i[new create ] do
    member do
      get 'choices', to: 'choices#choices'
      get 'image', to: 'memories#image'
    end
  end
end
