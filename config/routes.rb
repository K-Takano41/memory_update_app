Rails.application.routes.draw do
  resources :users, only: %i[new create show edit update destroy]
  root to: "top#top"
end
