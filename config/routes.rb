Rails.application.routes.draw do
  devise_for :users
  root "songs#index"
  resources :songs, only: [:index,:new,:create]
end
