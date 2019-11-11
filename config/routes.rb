Rails.application.routes.draw do
  root to: "favorites#index"

  get '/new'=> "favorites#new"

  get '/edit'=> "favorites#edit"
  get '/completion_registration'=> "favorites#completion_registration"
  get '/completion_edit'=> "favorites#completion_edit"
  get '/completion_delete'=> "favorites#completion_delete"
end
