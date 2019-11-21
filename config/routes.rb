Rails.application.routes.draw do
  devise_for :users
  root to: "favorites#index"

  get '/new'=> "favorites#new"

  get '/edit'=> "favorites#edit"
  get '/completion_registration'=> "favorites#completion_registration"
  get '/completion_edit'=> "favorites#completion_edit"
  get '/completion_delete'=> "favorites#completion_delete"

  resources :favorites
  resources :users, only: [:show,:edit, :update]
end
