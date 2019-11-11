Rails.application.routes.draw do
  root to: "favorites#index"

  get '/new'=> "favorites#new"
  get '/completion_registration'=> "favorites#completion_registration"
end
