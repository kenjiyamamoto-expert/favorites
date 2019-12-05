Rails.application.routes.draw do
  get 'links/create'
  get 'links/create'
  get 'links/destroy'
  devise_for :users
  root to: "favorites#index"

  get 'favorites/convinient' =>'favorites#convinient'
  get 'favorites/sns' =>'favorites#sns'
  get 'favorites/hobby' =>'favorites#hobby'
  get 'favorites/bussiness' =>'favorites#bussiness'
  get 'favorites/shopping' =>'favorites#shopping'
  get 'favorites/other' =>'favorites#other'


  resources :favorites do
    collection do
      get 'search'
    end
    resources :links, only: [:create, :destroy]
  end
  resources :users, only: [:show,:edit, :update]

 

end
