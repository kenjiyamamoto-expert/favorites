Rails.application.routes.draw do
  root to: "favorites#index"

  get '/new'=> "favorites#new"

  get '/edit'=> "favorites#edit"
  get '/completion_registration'=> "favorites#completion_registration"
end
