Rails.application.routes.draw do
  root to: "favorites#index"

  get '/new'=> "favorites#new"
end
