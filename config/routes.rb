Rails.application.routes.draw do
  get 'links/create'
  get 'links/create'
  get 'links/destroy'
  devise_for :users
  root to: "favorites#index"


  resources :favorites do
    collection do
      get 'search'
    end
    resources :links, only: [:create, :destroy]
  end
  resources :users, only: [:show,:edit, :update]
end
