Rails.application.routes.draw do
  get 'choices', to: "choices#choices"
  root to: "top#top"
  get 'auth/:provider/callback', to: "twitter_sessions#create"
  get 'auth/failure', to: "twitter_sessions#failure"
  get 'login', to: "user_sessions#new"
  post 'login', to: "user_sessions#create"
  delete 'logout', to: "user_sessions#destroy"
  resources :users, only: %i[new create show edit update destroy]
  resources :bad_events, only: %i[new create show edit update destroy]
end
