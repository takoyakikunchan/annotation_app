Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get  'index' =>'messages#index' 
  post 'confirm' => 'messages#confirm'
  post 'done' => 'messages#done' 
  resources :featurings
  resources :producers do
    resources :producer_profiles
  end
  resources :artists do
    resources :artist_profiles
  end
  root "songs#index"
  resources :songs  do
    resources :annotations
    resources :comments, only:[:create,:destroy] do
      resource :favorites, only:[:create,:destroy] 
  end
    collection do
      get 'search'
    end
  end
end
