Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :featurings
  resources :producers
  resources :artists do
    resources :artist_profiles
  end
  root "songs#index"
  resources :songs  do
    resources :comments, only:[:create,:destroy]
    collection do
      get 'search'
    end
  end
end
