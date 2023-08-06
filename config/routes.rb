Rails.application.routes.draw do
  namespace :admin do
    resources :prompts
  end
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  # if Rails.env.development?
  #   require "sidekiq/web"
  #   mount Sidekiq::Web => "/sidekiq"
  # end
  root to: 'top#top'
  get 'auth/:provider/callback', to: 'twitter_sessions#create'
  get 'auth/failure', to: 'twitter_sessions#failure'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[new create show]
  resources :bad_events, only: %i[new create edit update] do
    get 'image', to: 'images#generate'
  end
  resources :memories, only: %i[index show], shallow: true do
    get 'page_change', on: :member
    get 'user_memories', on: :collection
    resources :good_events, only: %i[new create show edit update]
  end
end
