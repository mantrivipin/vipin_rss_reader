Rails.application.routes.draw do
  get 'entries/index'

  get 'entries/show'

  resources :feeds
  resources :entries, only: [:index]
  devise_for :users
  root to: "feeds#index"
end
